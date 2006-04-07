package testAutoDB17_Bottom;
use Class::AutoClass;
@ISA=qw(testAutoDB17_Top);
  
@AUTO_ATTRIBUTES=qw();
# Do not define %AUTODB. Rely instead on super-class

Class::AutoClass::declare(__PACKAGE__);

1;
