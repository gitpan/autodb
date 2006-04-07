package Class::AutoDB::Oid;
use Class::AutoDB::Serialize;
use Class::AutoDB::Globals;
use Scalar::Util qw(refaddr);

my $GLOBALS=Class::AutoDB::Globals->instance();
my $OID2OBJ=$GLOBALS->oid2obj;
my $OBJ2OID=$GLOBALS->obj2oid;

sub DUMPER_freeze {return $_[0];}
sub DUMPER_thaw {
  my($self)=@_;
  my $oid=$self->{_OID};
  #print "<<< Class::AutoDB::Oid::DUMPER_thaw $self ($oid)\n";  
  my $obj=$OID2OBJ->{$oid};
  return $obj if $obj;
  $OID2OBJ->{$oid}=$self;	# save for next time -- to preserve shared object structure
  $OBJ2OID->{refaddr $self}=$oid;
  $self;
}
# AutoClass defines a 'class' method but invoking it on an Oid
#  forces a fetch. We override method here to avoid fetch.
sub class {$_[0]->{_CLASS};}

use vars qw($AUTOLOAD);
sub AUTOLOAD {
  my $self=shift;
  my $method=$AUTOLOAD;
  $method=~s/^.*:://;             # strip class qualification
  return if $method eq 'DESTROY'; # the books say you should do this
  my $oid=$self->{_OID};

  ####################
  # use object's class if not already done
  # Caution: this all works fine if people follow the Perl convention of
  #  placing module Foo in file Foo.pm.  Else, there's no easy way to
  #  translate a classname into a string that can be 'used'
  # The test 'unless %{$class.'::'}' cause the 'use' to be skipped if
  #  the class is already loaded.  This should reduce the opportunities
  #  for messing up the class-to-file translation.
  # Note that %{$class.'::'} is the symbol table for the class
  # Have to do the test before fetch, since fetch creates minimal symbol 
  #  table by blessing the thawed object.
  my $class=$self->{_CLASS};
  eval "use $class" unless %{$class.'::'};
  if ($@) {			# 'use' failed
    die "Unable to use $class" if $@=~/^Can\'t locate/;
    die $@;
  }
  ####################
  my $obj=Class::AutoDB::Serialize::fetch($oid);

  return $obj->$method(@_);
}
####################
# NG 05-12-26
# Fetch object when used as string, so serialized objects will work as expected
# when used as hash keys. Body of code same as AUTOLOAD. 
# TODO: refactor someday
sub stringify {
  my $self=shift;
  my($oid,$class)=@$self{qw(_OID _CLASS)};
  eval "use $class" unless %{$class.'::'};
  if ($@) {			# 'use' failed
    die "Unable to use $class" if $@=~/^Can\'t locate/;
    die $@;
  }
  my $obj=Class::AutoDB::Serialize::fetch($oid);
  $obj;
}
# Code below adapted from Graph v0.67
sub eq {"$_[0]" eq "$_[1]"}
sub ne {"$_[0]" ne "$_[1]"}
use overload
  '""' => \&stringify,
  'bool'=>sub {defined $_[0]},
  'eq' => \&eq,
  'ne' => \&ne,
  fallback => 'TRUE';
####################
