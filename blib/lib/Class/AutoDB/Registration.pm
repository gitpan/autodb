package Class::AutoDB::Registration;

use vars qw(@ISA @AUTO_ATTRIBUTES @OTHER_ATTRIBUTES %SYNONYMS %DEFAULTS);
use strict;
use Class::AutoClass;
use Carp;
@ISA = qw(Class::AutoClass); # AutoClass must be first!!

@AUTO_ATTRIBUTES=qw(class collections keys transients);
@OTHER_ATTRIBUTES=qw();
%SYNONYMS=(collection=>'collections');
%DEFAULTS=(collections=>{},keys=>{},transients=>[]);
Class::AutoClass::declare(__PACKAGE__);

sub _init_self {
  my($self,$class,$args)=@_;
  return unless $class eq __PACKAGE__; # to prevent subclasses from re-running this

  # parse and normalize the various parameters
  my ($class_param,$coll_param,$keys_param,$tran_param)=
    $self->get qw(-class -collections -keys -transients);
  confess "Not valid to specify -keys when -collections is HASH"
    if $args->keys && ref $args->collections eq 'HASH';
  confess "Not valid to specify -transients without -class" 
    if !$class_param && $args->tran_param;

  my $keys=parse_keys($keys_param);
  my $collections={};
  if ('HASH' eq ref $coll_param) { # usual case: collections={collname=>key value pairs}
    while(my($collname,$keys)=each %$coll_param) {
      $collections->{$collname}=parse_keys($keys);
    }
    if (1==scalar(values %$collections)) { # set $keys to keys of the 1 collection
      my($coll_name)=keys %$collections;
      $keys=$collections->{$coll_name};
    }
  } else {			# one or more collection names.  ARRAY ref or string
    $coll_param=parse_list($coll_param) unless ref $coll_param;
    for my $collname (@$coll_param) { 
      $collections->{$collname}=$keys; # only sensible for single collection name, but...
    }
  }
  my $transients=parse_list($tran_param);

  # put the parsed values back into object
  $self->set (-collections=>$collections,-keys=>$keys,-transients=>$transients);
}
sub collnames {[keys %{$_[0]->collections}];}

sub parse_keys {
  my($arg)=@_;
  my $keys={};
  if ('HASH' eq ref $arg) {	    # easy case: $arg already parsed
    $keys=$arg;
  } elsif ('ARRAY' eq ref $arg)  {  # each key has type 'string'
    map {$keys->{$_}='string'} @$arg;
  } else {			    # have to parse string
    my @args=split(/\s*,\s*/,$arg); # split string at commas
    for my $arg (@args) {
      $arg=~s/^\s*(.*?)\s*$/$1/;
      $arg=~s/\s+/ /g;
      my($key,$type)=($arg=~/^\W*(\w+)\W*(\w.*){0,1}/);
      $type=~s/\s+//g;		# clear any remaining whitespace from type
      $type or $type='string';	# set default type
      $keys->{$key}=$type;
    }
  }
  wantarray? %$keys: $keys;
}
# parse list of words
sub parse_list {
  my $list;
  if (@_==1 && 'ARRAY' eq ref $_[0]) {     # called with ARRAY ref
    $list=$_[0];
  } else {		           # called with one or more strings
    $list=[];
    @$list=map {split(/\W+/,$_)} @_; # split into words
  }
  wantarray? @$list: $list;
}
1;

__END__

=head1 NAME

Class::AutoDB::Registration - One registration for
Class::AutoDB::Registry

=head1 SYNOPSIS

This is a helper class for Class::AutoDB::Registry which represents one
entry in a registry.

 use Class::AutoDB::Registration;
 my $registration=new Class::AutoDB::Registration
   (-class=>'Class::Person',
    -collection=>'Person',
    -keys=>qq(name string, dob integer, significant_other object, 
              friends list(object)),
    -transients=>[qw(age)],
    -auto_gets=>[qw(significant_other)]);
 
 # Set the object's attributes
 my $collection=$registration->collection;
 my $class=$registration->class;
 my $keys=$registration->keys;
 my $transients=>$registration->transients;
 my $auto_gets=>$registration->auto_gets;

=head1 DESCRIPTION

This class represents essentially raw registration information
submitted via the 'register' method of Class::AutoDB::Registry. This
class parses the 'keys' parameter, but does not verify that attribute
names and data types are valid. This class I<does not talk to the
database>.

The 'keys' parameter consists of attribute, data type pairs, or can
also be an ARRAY ref of attribute names. In the latter case the data
type of each attribute is assumed to be 'string'.

=head1 BUGS and WISH-LIST

[none]

=head1 METHODS and FUNCTIONS - Initialization

see  L<http://search.cpan.org/~ccavnor/Class-AutoDB-0.091/docs/Registration.html#methods_and_functions>

=cut
