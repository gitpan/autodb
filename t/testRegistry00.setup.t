use lib qw(./t blib/lib);
use strict;
use Test::More qw/no_plan/;
use DBI;
use File::Basename;

# The testRegisty series tests Class::AutoDB::Registry
# This test sets up the database needed for later tests.
#
# This version assumes a fixed names for this database
#   TODO: allow database names to be set somehow

my $sql=tify('test.setup.sql');
system("mysql test < $sql"); # TODO: do this via Database component

# make sure we can talk to MySQL and database exists
my $dbh=DBI->connect('dbi:mysql:database=test');
die "! Cannot connect to database: ".$dbh->errstr."\n".
  "These tests require a MySQL database named 'test'.  The user running the test must have permission to create and drop tables, and select and update data."
      if $dbh->err;

is(1,1); #just to quiet the test harness ;)

1;
# "t-ify" file name
sub tify {
  my($filename)=@_;
  my $pwd_base=basename($ENV{'PWD'});
  $pwd_base eq 't'? $filename: "t/$filename";
}
