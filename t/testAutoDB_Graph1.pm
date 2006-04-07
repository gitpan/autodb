package testAutoDB_Graph;
use vars qw(@ISA @AUTO_ATTRIBUTES @OTHER_ATTRIBUTES %SYNONYMS %DEFAULTS %AUTODB);
use Class::AutoClass;
use Graph;
use strict;
@ISA = qw(Class::AutoClass); # AutoClass must be first!!

@AUTO_ATTRIBUTES=qw(id graph);
%SYNONYMS=();
@OTHER_ATTRIBUTES=qw();
%DEFAULTS=();
%AUTODB=(-collection=>'testAutoDB_Graph',-keys=>qq(id string));
Class::AutoClass::declare(__PACKAGE__);

sub _init_self {
  my($self,$class,$args)=@_;
  return unless $class eq __PACKAGE__; # to prevent subclasses from re-running this
  $self->graph(new Graph(undirected=>1));
  my $nodes=$args->nodes;
  defined($nodes) and $self->add_nodes(@$nodes);
  my $edges=$args->edges;
  defined($edges) and $self->add_edges(@$edges);
}
sub nodes {
  my $self=shift;
  my @ret=$self->graph->vertices;
  wantarray? @ret: \@ret;
}
sub edges {
  my $self=shift;
  my @ret=$self->graph->edges;
  wantarray? @ret: \@ret;
}
sub add_nodes {
  my($self,@ids)=@_;
  $self->graph->add_vertices(@ids);
}
*add_node=\&add_nodes;

sub add_edges {
  my $self=shift @_;
  my $graph=$self->graph;
  while (@_) {
    my($m,$n);
    if ('ARRAY' eq ref $_[0]) {
      ($m,$n)=@$_[0];
    } else {
      ($m,$n)=(shift,shift);
    }
    last unless defined $m && defined $n;
    $graph->add_edge($m,$n);
  }
}
*add_edge=\&add_edges;

################################################################################
# Functions below here are for making test graphs
################################################################################
use Class::AutoClass::Args;

my %DEFAULT_ARGS=
  (CIRCUMFERENCE=>100,
   CONE_SIZE=>10,
   HEIGHT=>20,
   WIDTH=>20,
   ARITY=>2,
   DEPTH=>3,
   NODES=>100,
  );

sub binary_tree {regular_tree(@_,-arity=>2)}
sub ternary_tree {regular_tree(@_,-arity=>3)}

sub chain {
  my $args=new Class::AutoClass::Args(@_);
  my $chain=new testAutoDB_Graph;
  my($nodes)=get_args($args,qw(nodes));
  if ($nodes) {
    for (my $new=1; $new<$nodes; $new++) {
      $chain->add_edge($new-1,$new);
    }}
  $chain;
}
sub regular_tree {
  my $args=new Class::AutoClass::Args(@_);
  my $tree=$args->graph || new testAutoDB_Graph;
  my($depth,$arity,$root)=get_args($args,qw(depth arity root));
  defined $root or $root=0;
  $tree->add_node($root);
  if ($depth>0) {
    for (my $i=0; $i<$arity; $i++) {
      my $child="$root/$i";
      $tree->add_edge($root,$child);
      regular_tree(graph=>$tree,depth=>$depth-1,arity=>$arity,root=>$child);
    }
  }
  $tree;
}

sub star {
  my $args=new Class::AutoClass::Args(@_);
  my $star=new testAutoDB_Graph;
  my($nodes)=get_args($args,qw(nodes));
  if ($nodes) {
    my $center=0;
    for (my $point=1; $point<$nodes; $point++) {
      $star->add_edge($center,$point);
    }}
  $star
}
sub cycle {
  my $args=new Class::AutoClass::Args(@_);
  my $graph=new testAutoDB_Graph;
  my($nodes)=get_args($args,qw(nodes));
  # make simple cycle
  for (my $i=1; $i<$nodes; $i++) {
    $graph->add_edge($i-1,$i);
  }
  $graph->add_edge($nodes-1,0);
  $graph;
}
sub clique {
  my $args=new Class::AutoClass::Args(@_);
  my $graph=new testAutoDB_Graph;
  my($nodes)=get_args($args,qw(nodes));
  for (my $i=0; $i<$nodes-1; $i++) {
    for (my $j=$i+1; $j<$nodes; $j++) {
      $graph->add_edge($i,$j);
    }
  }
  $graph;
}
sub cone_graph {
  my $args=new Class::AutoClass::Args(@_);
  my $graph=new testAutoDB_Graph;
  my($cone_size)=get_args($args,qw(cone_size));
  # make $cone_size simple cycles of sizes 1..$cone_size
  for (my $i=0; $i<$cone_size; $i++) {
    my $circumference=$i+1;
    # make simple cycle
    for (my $j=1; $j<$circumference; $j++) {
      $graph->add_edge($i.'/'.($j-1),"$i/$j");
    }
    $graph->add_edge($i.'/'.($circumference-1),"$i/0");
  }
  # add edges between cycles
  for (my $i=0; $i<$cone_size-2; $i++) {
    for (my $j=$i+1; $j<$cone_size; $j++) {
      $graph->add_edge("$i/0","$j/0");
    }}
  $graph;
}
sub grid {
  my $args=new Class::AutoClass::Args(@_);
  my $graph=new testAutoDB_Graph;
  my($height,$width)=get_args($args,qw(height width));
  for (my $i=0; $i<$height; $i++) {
    for (my $j=0; $j<$width; $j++) {
      my $node=grid_node($i,$j);
      $graph->add_node($node);
      $graph->add_edge(grid_node($i-1,$j),$node) if $i>0; # down
      $graph->add_edge(grid_node($i,$j-1),$node) if $j>0; # right
    }}
  $graph;
}
sub torus {
  my $args=new Class::AutoClass::Args(@_);
  my $graph=new testAutoDB_Graph;
  my($height,$width)=get_args($args,qw(height width));
  for (my $i=0; $i<$height; $i++) {
    for (my $j=0; $j<$width; $j++) {
      my $node=grid_node($i,$j);
      $graph->add_node($node);
      $graph->add_edge(grid_node($i-1,$j),$node) if $i>0; # down
      $graph->add_edge(grid_node($i,$j-1),$node) if $j>0; # right
    }}
  # add wrapround edges, making grid a torus
  if ($width>1) {
    for (my $i=0; $i<$height; $i++) {
      $graph->add_edge(grid_node($i,$width-1),grid_node($i,0));
    }}
  if ($height>1) {
    for (my $j=0; $j<$width; $j++) {
      $graph->add_edge(grid_node($height-1,$j),grid_node(0,$j));
    }}
  $graph;
}
sub grid_node {my($i,$j)=@_; $j=$i unless defined $j; "$i/$j";}


sub get_args {
  my $args=shift;
  my @args;
  for my $keyword (@_) {
    my $arg=$args->$keyword;
    defined $arg or $arg=$DEFAULT_ARGS{uc $keyword};
    push(@args,$arg);
  }
  wantarray? @args: $args[0];
}
*get_arg=\&get_args;
1;

