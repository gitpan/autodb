package Person;
use Class::AutoClass;
use Class::AutoDB::Serialize;
@ISA=qw(Class::AutoClass Class::AutoDB::Serialize); # AutoClass must be first!!;
  
@AUTO_ATTRIBUTES=qw(name sex hobbies friends);
@OTHER_ATTRIBUTES=qw();
%SYNONYMS=();
Class::AutoClass::declare(__PACKAGE__);

use overload
  fallback => 'TRUE';
1;
