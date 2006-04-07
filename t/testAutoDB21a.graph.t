use lib qw(./t blib/lib);
use strict;
use Test::More qw/no_plan/;
use DBI;
use Class::AutoDB::Object;
use testAutoDB_Graph1;

# This test creates and stores graphs for later fetch by 
# its companion test
# make sure we can talk to MySQL and database exists
my $dbh=DBI->connect('dbi:mysql:database=test');
die "! Cannot connect to database: ".$dbh->errstr."\n".
  "These tests require a MySQL database named 'test'.  The user running the test must have permission to create and drop tables, and select and update data."
  if $dbh->err;
my $autodb=new Class::AutoDB(-database=>'test',-create=>1);

my $graph=testAutoDB_Graph::chain();
store('chain',$graph);

my $graph=testAutoDB_Graph::star();
store('star',$graph);

my $graph=testAutoDB_Graph::binary_tree(-depth=>5);
store('binary_tree',$graph);

my $graph=testAutoDB_Graph::ternary_tree(-depth=>5);
store('ternary_tree',$graph);

my $graph=testAutoDB_Graph::cycle();
store('cycle',$graph);

my $graph=testAutoDB_Graph::clique(-nodes=>20);
store('clique',$graph);

my $graph=testAutoDB_Graph::cone_graph();
store('cone_graph',$graph);

my $graph=testAutoDB_Graph::grid();
store('grid',$graph); 

my $graph=testAutoDB_Graph::torus();
store('torus',$graph); 

sub store {
  my($id,$graph)=@_;
  $graph->id($id);
  $graph->put;
  ok(1,$id);
}
