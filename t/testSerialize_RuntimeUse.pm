package testSerialize_RuntimeUse;

# class whose module name is the same as its filename.
# see testSerialize_Nuts for the other case

use vars qw(@ISA @AUTO_ATTRIBUTES @OTHER_ATTRIBUTES %SYNONYMS %DEFAULTS);
use strict;
use Class::AutoClass;
use Class::AutoDB::Serialize;
@ISA=qw(Class::AutoClass Class::AutoDB::Serialize); # AutoClass must be first!!;

@AUTO_ATTRIBUTES=qw(id sane prev next list);
%DEFAULTS=(list=>[]);
%DEFAULTS=(neighbors=>[]);
Class::AutoClass::declare(__PACKAGE__);

use overload
  fallback => 'TRUE';
1;
