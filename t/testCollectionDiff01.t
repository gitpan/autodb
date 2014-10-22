use lib qw(./t blib/lib);
use strict;
use Test::More qw/no_plan/;
use Class::AutoDB::Collection;
use Class::AutoDB::CollectionDiff;
use Class::AutoDB::Registration;

sub is_bool {			# tests logical equivalence
  my($a,$b,$testname)=@_;
  my($bool_a,$bool_b)=map {$_? 1: 0} ($a,$b);
  is($bool_a,$bool_b,$testname);
}

my $reg1 = new Class::AutoDB::Registration
  (-class=>'Class::Person',
   -collection=>'Person',
   -keys=>qq(name string, sex string, significant_other object, friends list(object), uh_oh string));
my $reg2 = new Class::AutoDB::Registration
  (-class=>'Class::Same',
   -collection=>'Human',
   -keys=>qq(name string, sex string, significant_other object, friends list(object), uh_oh string));
my $reg3 = new Class::AutoDB::Registration
  (-class=>'Class::Plant',
   -collection=>'Flower',
   -keys=>qq(name string, petals int, color string, uh_oh int));
my $reg4 = new Class::AutoDB::Registration
  (-class=>'Class::subPlant',
   -collection=>'Flowerette',
   -keys=>qq(name string, petals int, color string));

my $like_reference_object = Class::AutoDB::CollectionDiff->new
  (-baseline=>Class::AutoDB::Collection->new($reg1),
   -other=>Class::AutoDB::Collection->new($reg2));
my $unlike_reference_object = Class::AutoDB::CollectionDiff->new
  (-baseline=>Class::AutoDB::Collection->new($reg1),
   -other=>Class::AutoDB::Collection->new($reg3));
my $super_reference_object = Class::AutoDB::CollectionDiff->new
  (-baseline=>Class::AutoDB::Collection->new($reg4),
   -other=>Class::AutoDB::Collection->new($reg3));
my $sub_reference_object = Class::AutoDB::CollectionDiff->new
  (-baseline=>Class::AutoDB::Collection->new($reg3),
   -other=>Class::AutoDB::Collection->new($reg4));

# test isa
is(ref($like_reference_object), "Class::AutoDB::CollectionDiff",'isa');
is(ref($unlike_reference_object), "Class::AutoDB::CollectionDiff",'isa');

# test diff
my $diff = $unlike_reference_object;

ok( ($diff->baseline =~ /Class::AutoDB::Collection/) && ($diff->other =~ /Class::AutoDB::Collection/), "diff contains Collection objects");
is(scalar keys %{$diff->same_keys}, 1, "same_keys contains correct number of keys");
is($diff->same_keys->{name}, "string", "same_keys contains correct value");
is(scalar keys %{$diff->baseline_only}, 3, "baseline_only contains correct number of keys");
is($diff->baseline_only->{friends}, "list(object)", "baseline_only contains correct value");
is($diff->baseline_only->{significant_other}, "object", "baseline_only contains correct value");
is($diff->baseline_only->{sex}, "string", "baseline_only contains correct value");
is(scalar keys %{$diff->new_keys}, 2, "new_keys contains correct number of keys");
is($diff->new_keys->{color}, "string", "new_keys contains correct value");
is($diff->new_keys->{petals}, "int", "new_keys contains correct value");
is($diff->{inconsistent_keys}->{uh_oh}->[0], "string", "checking types of inconsistent keys");
is($diff->{inconsistent_keys}->{uh_oh}->[1], "int", "checking types of inconsistent keys");

# test is consistent
my $self = shift;
my $unlike_diff = $unlike_reference_object;
my $like_diff = $like_reference_object;
is_bool($unlike_diff->is_consistent, 0, "is_consistent check passes with unlike collections");
is_bool($like_diff->is_consistent, 1, "is_consistent check passes with like collections");

# test is inconsistent
$unlike_diff = $unlike_reference_object;
$like_diff = $like_reference_object;
is_bool($unlike_diff->is_inconsistent, 1, "is_inconsistent check passes with unlike collections");
is_bool($like_diff->is_inconsistent, 0, "is_inconsistent check passes with like collections");

# test is equivalent
$unlike_diff = $unlike_reference_object;
$like_diff = $like_reference_object;
is_bool($unlike_diff->is_equivalent, 0, "is_equivalent check passes with unlike collections");
is_bool($like_diff->is_equivalent, 1, "is_equivalent check passes with like collections");

# test is different
$unlike_diff = $unlike_reference_object;
$like_diff = $like_reference_object;
is_bool($unlike_diff->is_equivalent, 0, "is_different check passes with unlike collections");
is_bool($like_diff->is_equivalent, 1, "is_different check passes with like collections");

# test is sub member
my $sub_diff = $sub_reference_object;
my $super_diff = $super_reference_object;
is_bool($sub_diff->is_sub, 1, "is_sub check passes with sub collections");
is_bool($super_diff->is_sub, 0, "is_sub check fails with super collections");

# test is super member
$sub_diff = $sub_reference_object;
$super_diff = $super_reference_object;
is_bool($sub_diff->is_super, 0, "is_super check fails with sub collections");
is_bool($super_diff->is_super, 1, "is_super check passes with super collections");

# test is expanded
$sub_diff = $sub_reference_object;
$super_diff = $super_reference_object;
is_bool($sub_diff->is_expanded, 0, "is_expanded check fails with sub collections");
is_bool($super_diff->is_expanded, 1, "is_expanded check passes with super collections");
