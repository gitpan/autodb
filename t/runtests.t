use strict;
use Test::Harness;
use Carp;
use File::Basename;

# Driver for tests. NG style

my $tdir=basename($ENV{'PWD'}) eq 't'? '.': 't';
my @test_files=grep /\.t$/,@ARGV;
confess "Need to supply this verison of runtest with list of tests" unless (@test_files);
$Test::Harness::switches='';	# turn off -w
runtests(@test_files);

sub tify {
  my($filename)=@_;
  my $pwd_base=basename($ENV{'PWD'});
  
  $pwd_base eq 't'? $filename: "t/$filename";
}
