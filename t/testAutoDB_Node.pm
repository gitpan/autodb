package testAutoDB_Node;

# represents one node of a graph

use vars qw(@ISA @AUTO_ATTRIBUTES @OTHER_ATTRIBUTES %SYNONYMS %DEFAULTS %AUTODB);
use strict;
use Class::AutoClass;
use Class::AutoDB::Serialize;
@ISA=qw(Class::AutoClass Class::AutoDB::Serialize); # AutoClass must be first!!;

@AUTO_ATTRIBUTES=qw(id neighbors);
%DEFAULTS=(neighbors=>[]);
%AUTODB=(-collection=>'testAutoDB_Node');
Class::AutoClass::declare(__PACKAGE__);

sub add_neighbor {
  my($self,$neighbor)=@_;
  push(@{$self->neighbors},$neighbor) unless $self==$neighbor;
}
1;
