package testAutoDB17_Top;
use Class::AutoClass;
@ISA=qw(Class::AutoClass);
  
@AUTO_ATTRIBUTES=qw(id);
%AUTODB=
  (-collection=>'testAutoDB17',
   -keys=>qq(id string),
  ) ;
Class::AutoClass::declare(__PACKAGE__);

1;
