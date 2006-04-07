use lib qw(./t lib blib/lib);
use strict;
use Class::AutoDB;
use Test::More qw/no_plan/;
use Test::Deep;
use Set::Scalar;
use Class::AutoDB::Object;
use testAutoDB17_Top;
use testAutoDB17_Bottom;

# regression test for bug in which subclasses do not correctly inherit collections from
# parent classes
# This program fetches the objects.  Companion test puts them.

# make sure we can talk to MySQL and database exists
my $dbh=DBI->connect('dbi:mysql:database=test');
die "! Cannot connect to database: ".$dbh->errstr."\n".
  "These tests require a MySQL database named 'test'.  The user running the test must have permission to create and drop tables, and select and update data."
  if $dbh->err;
my $autodb=new Class::AutoDB(-database=>'test');

# create test objects -- expected state of objects from testAutoDB17a....
my $top=new testAutoDB17_Top(-id=>'a Top object');
my $bot=new testAutoDB17_Bottom(-id=>'a Bottom object');

my $cursor=$autodb->find(-collection=>'testAutoDB17'); # run query
my $t_objs=$cursor->get;
is(scalar @$t_objs,2,"get: number of objects");
cmp_deeply($t_objs,bag($top,$bot),"objects");

