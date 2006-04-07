use lib qw(./t blib/lib);
use strict;
use Test::More qw/no_plan/;
use Test::Deep;
use DBI;
use Class::AutoDB::Object;
use testAutoDB_Graph;

# This test creates and stores graphs for later fetch by 
# its companion test
# make sure we can talk to MySQL and database exists
my $dbh=DBI->connect('dbi:mysql:database=test');
die "! Cannot connect to database: ".$dbh->errstr."\n".
  "These tests require a MySQL database named 'test'.  The user running the test must have permission to create and drop tables, and select and update data."
  if $dbh->err;
my $autodb=new Class::AutoDB(-database=>'test');

my $graph=testAutoDB_Graph::chain();
fetch_n_test('chain',$graph);

my $graph=testAutoDB_Graph::star();
fetch_n_test('star',$graph);

my $graph=testAutoDB_Graph::binary_tree(-depth=>5);
fetch_n_test('binary_tree',$graph);

my $graph=testAutoDB_Graph::ternary_tree(-depth=>5);
fetch_n_test('ternary_tree',$graph);

my $graph=testAutoDB_Graph::cycle();
fetch_n_test('cycle',$graph);

my $graph=testAutoDB_Graph::clique(-nodes=>20);
fetch_n_test('clique',$graph);

my $graph=testAutoDB_Graph::cone_graph();
fetch_n_test('cone_graph',$graph);

my $graph=testAutoDB_Graph::grid();
fetch_n_test('grid',$graph); 

my $graph=testAutoDB_Graph::torus();
fetch_n_test('torus',$graph); 

sub fetch_n_test {
  my($id,$correct)=@_;
  my $cursor=$autodb->find(-collection=>'testAutoDB_Graph',id=>$id); # run query
  my($actual)=$cursor->get;
  my @c_nodes=$correct->nodes;
  my @a_nodes=$actual->nodes;
  @c_nodes=sort by_id @c_nodes;
  @a_nodes=sort by_id @a_nodes;
  my @c_ids=map {$_->id} @c_nodes;
  my @a_ids=map {$_->id} @a_nodes;
  cmp_deeply(\@c_ids,\@a_ids,"$id: nodes");
  my @c_edges=$correct->edges;
  my @a_edges=$actual->edges;
  @c_edges=sort by_ends @c_edges;
  @a_edges=sort by_ends @a_edges;
  my @c_ends=map {ends($_)} @c_edges;
  my @a_ends=map {ends($_)} @a_edges;
  cmp_deeply(\@c_ends,\@a_ends,"$id: edges");
}

sub by_id {$a->id cmp $b->id;}
sub by_ends {
  ends($a) cmp ends($b);
}
sub ends {
  my($edge)=@_;
  my($m,$n)=map {$_->id} @{$edge->nodes};
  "$m-$n";
}
1;
