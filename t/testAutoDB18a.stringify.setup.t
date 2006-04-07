use lib qw(./t lib blib/lib);
use strict;
use Class::AutoDB;
use Test::More qw/no_plan/;
use Class::AutoDB::Object;
use testAutoDB18;

# test stringification

# make sure we can talk to MySQL and database exists
my $dbh=DBI->connect('dbi:mysql:database=test');
die "! Cannot connect to database: ".$dbh->errstr."\n".
  "These tests require a MySQL database named 'test'.  The user running the test must have permission to create and drop tables, and select and update data."
  if $dbh->err;
my $autodb=new Class::AutoDB(-database=>'test',-create=>1);

my $OBJECTS=5;
my $root=new testAutoDB(id=>'root');
# make some objects
my @objects=map {new testAutoDB(id=>$_)} (0..$OBJECTS-1);
#store them in root's list
$root->list(\@objects);
$root->list1(\@objects);
$root->list2(\@objects);
ok(1,"created $OBJECTS objects");
map {$_->put} ($root,@objects);	# store root and list of objects
ok(1,"stored $OBJECTS objects");


ok(1,'end of test');
