use lib qw(./t lib blib/lib);
use strict;
use Class::AutoDB;
use Test::More qw/no_plan/;
use Set::Scalar;
use Class::AutoDB::Object;
use testAutoDB17_Top;
use testAutoDB17_Bottom;

# regression test for bug in which subclasses do not correctly inherit collections from
# parent classes
# This program puts the objects.  Companion test fetches them

# make sure we can talk to MySQL and database exists
my $dbh=DBI->connect('dbi:mysql:database=test');
die "! Cannot connect to database: ".$dbh->errstr."\n".
  "These tests require a MySQL database named 'test'.  The user running the test must have permission to create and drop tables, and select and update data."
  if $dbh->err;
my $autodb=new Class::AutoDB(-database=>'test',-create=>1);

my $top=new testAutoDB17_Top(-id=>'a Top object');
my $bot=new testAutoDB17_Bottom(-id=>'a Bottom object');
$top->put;
$bot->put;

ok(1,'end of test');
