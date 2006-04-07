use lib qw(./t lib blib/lib);
use strict;
use Class::AutoDB;
use Test::More qw/no_plan/;
use Test::Deep;
use Set::Scalar;
use Class::AutoDB::Object;
use testAutoDB16;

# make sure we can talk to MySQL and database exists
my $dbh=DBI->connect('dbi:mysql:database=test');
die "! Cannot connect to database: ".$dbh->errstr."\n".
  "These tests require a MySQL database named 'test'.  The user running the test must have permission to create and drop tables, and select and update data."
  if $dbh->err;
my $autodb=new Class::AutoDB(-database=>'test');

# create test objects -- expected state of objects from testAutoDB16a.put.t
my $obj1=new testAutoDB(-string=>'object 1 with transient attributes');
my $obj2=new testAutoDB(-string=>'object 2 with transient attributes');

my $cursor=$autodb->find(-collection=>'testAutoDB16'); # run query
my $objs=$cursor->get;
is(scalar @$objs,2,"get: number of objects");
cmp_deeply($objs,bag($obj1,$obj2),"objects");

