use Test::Harness;
use strict;
use File::Basename;

# Driver for Class::AutoDB::Registry tests

my @test_files=
  qw(testRegistry00.setup.t
     testRegistry01.register.t
     testRegistry02.merge.t
     testRegistry03.schema.t
     testRegistry04a.persistent.t
     testRegistry04b.persistent.t
     testRegistry04c.persistent.t
     testRegistry04d.persistent.t
     testRegistry04e.persistent.t
     testRegistry04f.persistent.t
     testRegistry04g.persistent.t
     testRegistry04h.persistent.t
     testRegistry04i.persistent.t
     testRegistry04j.persistent.t
    );
# "t-ify" file name
sub tify {
  my($filename)=@_;
  my $pwd_base=basename($ENV{'PWD'});
  $pwd_base eq 't'? $filename: "t/$filename";
}
@test_files=map {tify($_)} @test_files;
$Test::Harness::switches='';	# turn off -w
runtests(@test_files);
