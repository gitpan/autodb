package testAutoDB;
use Class::AutoClass;
@ISA=qw(Class::AutoClass);
  
@AUTO_ATTRIBUTES=qw(string transient1 transient2);
%AUTODB=
  (-collection=>'testAutoDB16',
   -keys=>qq(string string),
   -transients=>qw(transients1 transients2))
  ;
Class::AutoClass::declare(__PACKAGE__);

1;
