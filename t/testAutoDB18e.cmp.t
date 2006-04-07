use lib qw(./t blib/lib);
use strict;
use Test::More qw/no_plan/;
use DBI;
use Fcntl;   # For O_RDWR, O_CREAT, etc.
use SDBM_File;
use Class::AutoDB::Object;
use testAutoDB18;

# make sure we can talk to MySQL and database exists
my $dbh=DBI->connect('dbi:mysql:database=test');
die "! Cannot connect to database: ".$dbh->errstr."\n".
  "These tests require a MySQL database named 'test'.  The user running the test must have permission to create and drop tables, and select and update data."
  if $dbh->err;
my $autodb=new Class::AutoDB(-database=>'test');

my $OBJECTS=5;
my $cursor=$autodb->find(-collection=>'testAutoDB18',id=>'root'); # run query
my $objs=$cursor->get;
is(scalar @$objs,1,"get root: number of objects");
my $root=$objs->[0];

my @objects=@{$root->list};
my @objects1=@{$root->list1};
my @objects2=@{$root->list2};

ok(@objects==$OBJECTS&&@objects1==$OBJECTS&&@objects2==$OBJECTS,
   "root points to $OBJECTS objects (all 3 lists)");
my @refs_oid=map {ref $_} @objects;
my @refs_oid1=map {ref $_} @objects1;
my @refs_oid2=map {ref $_} @objects2;
ok(grep(/Class::AutoDB::Oid/,@refs_oid1)==$OBJECTS,"before cmp: objects in list are Oids");
ok(grep(/Class::AutoDB::Oid/,@refs_oid1)==$OBJECTS,"before cmp: objects in list1 are Oids");
ok(grep(/Class::AutoDB::Oid/,@refs_oid2)==$OBJECTS,"before cmp: objects in list2 are Oids");

my $errors;
for (my $i=0;$i<$OBJECTS;$i++) {
  $errors++ unless ($objects1[$i] cmp $objects2[$i])==0;
  $errors++ if $i!=0 && ($objects1[$i] cmp $objects[0])==0;
}
ok(!$errors,"examined $OBJECTS objects: $errors cmp errors");
my @refs_real=map {ref $_} @objects;
my @refs_real1=map {ref $_} @objects1;
my @refs_real2=map {ref $_} @objects2;
ok(grep(/testAutoDB/,@refs_real)==$OBJECTS,"after cmp: objects in list are real objects");
ok(grep(/testAutoDB/,@refs_real1)==$OBJECTS,"after cmp: objects in list1 are real objects");
ok(grep(/testAutoDB/,@refs_real2)==$OBJECTS,"after cmp: objects in list2 are real objects");

my $id_errors=0;
my $str_errors=0;
my $ref_errors=0;
for (my $i=0;$i<$OBJECTS;$i++) {
  my $obj=$objects1[$i];
  $id_errors++ unless $obj->id==$i;
  $str_errors++ unless ($obj cmp $objects[$i])==0;
  $ref_errors++ unless (ref $obj cmp $refs_real[$i])==0;
}
ok(!($id_errors+$str_errors+$ref_errors),
   "examined $OBJECTS objects in list1: $id_errors id errors, $str_errors stringify errors, $ref_errors ref errors");

1;
