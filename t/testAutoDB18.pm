package testAutoDB;
use strict;
use vars qw(@ISA @AUTO_ATTRIBUTES @OTHER_ATTRIBUTES %SYNONYMS %DEFAULTS %AUTODB);
use Class::AutoClass;
use Class::AutoDB::Serialize;
@ISA=qw(Class::AutoClass);

@AUTO_ATTRIBUTES=qw(id list list1 list2);
%DEFAULTS=(list=>[],list1=>[],list2=>[]);
%AUTODB=
  (-collection=>'testAutoDB18',
   -keys=>qq(id string, list list(object), list1 list(object), list2 list(object)));
Class::AutoClass::declare(__PACKAGE__);

1;
qq(id=>stirng)
