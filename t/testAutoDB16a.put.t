use lib qw(./t lib blib/lib);
use strict;
use Class::AutoDB;
use Test::More qw/no_plan/;
use Set::Scalar;
use Class::AutoDB::Object;
use testAutoDB16;

# test transient attributes

# make sure we can talk to MySQL and database exists
my $dbh=DBI->connect('dbi:mysql:database=test');
die "! Cannot connect to database: ".$dbh->errstr."\n".
  "These tests require a MySQL database named 'test'.  The user running the test must have permission to create and drop tables, and select and update data."
  if $dbh->err;
my $autodb=new Class::AutoDB(-database=>'test',-create=>1);

my $obj1=new testAutoDB(-string=>'object 1 with transient attributes',
		       -transients1=>'this string should not be stored',
		       -transients2=>'this string should not be stored');
$obj1->put;
my $obj2=new testAutoDB(-string=>'object 2 with transient attributes',
		       -transients1=>'this string should not be stored',
		       -transients2=>'this string should not be stored');
$obj2->put;

ok(1,'end of test');
