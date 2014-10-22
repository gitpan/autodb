package Class::AutoDB::CollectionDiff;

use vars qw(@ISA @AUTO_ATTRIBUTES @OTHER_ATTRIBUTES %SYNONYMS);
use strict;
use Class::AutoClass;
use Class::AutoDB::Collection;
@ISA = qw(Class::AutoClass); # AutoClass must be first!!

BEGIN {
  @AUTO_ATTRIBUTES=qw(baseline other
		      baseline_only new_keys same_keys inconsistent_keys
		      );
  @OTHER_ATTRIBUTES=qw();
  %SYNONYMS=();
  Class::AutoClass::declare(__PACKAGE__);
}
sub _init_self {
  my($self,$class,$args)=@_;
  return unless $class eq __PACKAGE__; # to prevent subclasses from re-running this
  my($baseline,$other)=$self->get(qw(baseline other));

  my($baseline_only,$new_keys,$same_keys,$inconsistent_keys);
  my $baseline_keys=$baseline->keys || {};
  my $other_keys=$other->keys || {};
  while(my($key,$type)=each %$baseline_keys) {
    my $other_type=$other_keys->{$key};
    if (defined $other_type) {
      if ($type eq $other_type) {
	$same_keys->{$key}=$type;
      } elsif ($type ne $other_type) {
	$inconsistent_keys->{$key}=[$type,$other_type];
      } else {
	$self->warn("Key $key fell through classification");
      }
    } else {			#  !defined $other_key
      $baseline_only->{$key}=$type;
    }
  }
  while(my($key,$other_type)=each %$other_keys) {
    $new_keys->{$key}=$other_type unless defined $baseline_keys->{$key};
  }

  $self->baseline_only($baseline_only || {});
  $self->new_keys($new_keys || {});
  $self->same_keys($same_keys || {});
  $self->inconsistent_keys($inconsistent_keys || {});
}
sub is_consistent {%{$_[0]->inconsistent_keys}==0;}
sub is_inconsistent {%{$_[0]->inconsistent_keys}>0;}
sub is_equivalent {
  my($self)=@_;
  my $baseline_keys=$self->baseline->keys || {};
  my $other_keys=$self->other->keys || {};
  %{$self->same_keys}==%$baseline_keys && %$baseline_keys==%$other_keys;
}
sub is_different {!$_[0]->is_equivalent;}
sub is_sub {$_[0]->is_consistent && %{$_[0]->new_keys}==0;}
sub is_super {$_[0]->is_consistent && %{$_[0]->baseline_only}==0;}
sub is_expanded {%{$_[0]->new_keys}>0;}

1;

__END__

=head1 NAME

Class::AutoDB::Collection - Compare two collection definitions and
maintain differences

=head1 SYNOPSIS

This is a helper class for Class::AutoDB::Registry to to process
differences between in-memory and saved registries

 use Class::AutoDB::CollectionDiff;
 use Class::AutoDB::Collection;
 my $diff=new Class::AutoDB::CollectionDiff
   (-baseline=>$saved, -change=>$in_memory);
 if ($diff->is_sub) {               # is new collection subset of saved one?
   $registry=$saved_registry;       # if so, use saved one
 } elsif  ($diff->is_different) {   # else get changes
   my %new_keys=$diff->new_keys;    # 
   my @expanded_collections=$diff->expanded_collections;
 } else {
   die “New collection inconsistent with old”;
 }

=head1 DESCRIPTION

This class compares two collection definitions and records their
differences. The first collection is considered the baseline, and
differences are reported relative to it. This class I<does not talk to
the database>.

=head1 BUGS and WISH-LIST

[None]

=head1 METHODS and FUNCTIONS - Initialization

see  L<http://search.cpan.org/~ccavnor/Class-AutoDB-0.091/docs/CollectionDiff.html#methods_and_functions>

=cut