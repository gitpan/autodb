use lib qw(./t lib blib/lib);
use strict;
use Class::AutoDB;
use Test::More qw/no_plan/;
use Test::Deep;
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
ok(@objects==$OBJECTS,"root points to $OBJECTS objects");
my @refs_oid=map {ref $_} @objects;
ok(grep(/Class::AutoDB::Oid/,@refs_oid)==$OBJECTS,"before stringify: objects in list are Oids");
my @stringify=map {"$_"} @objects;
ok(grep(/testAutoDB/,@stringify)==$OBJECTS,"stringify produced real objects");
my @refs_real=map {ref $_} @objects;
ok(grep(/testAutoDB/,@refs_real)==$OBJECTS,"after stringify: objects in list are real objects");
my $id_errors=0;
my $str_errors=0;
my $ref_errors=0;
for (my $i=0;$i<$OBJECTS;$i++) {
  my $obj=$objects[$i];
  $id_errors++ unless $obj->id==$i;
  $str_errors++ unless  $obj eq $stringify[$i];
  $ref_errors++ unless  ref $obj eq $refs_real[$i];
}
ok(!($id_errors+$str_errors+$ref_errors),
   "examined $OBJECTS objects: $id_errors id errors, $str_errors stringify errors, $ref_errors ref errors"); 
