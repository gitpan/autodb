package testAutoDB;
use strict;
use Class::AutoClass;
use Class::AutoDB;

use vars qw(@ISA @AUTO_ATTRIBUTES %AUTODB);
@ISA = qw(Class::AutoClass);

@AUTO_ATTRIBUTES=qw(skey1 lkey1 nonkey);

%AUTODB=
  (-collection=>'Collection',
   -keys=>q(skey1 string, skey2 integer, 
	    lkey1 list(string), lkey2 list(integer))
  );
Class::AutoClass::declare(__PACKAGE__);

1;

