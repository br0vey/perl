#!/usr/bin/perl
package setgetm;
 use strict;
 use warnings;
 use setget qw(get_x set_x $x $y );
#our $x;
#our $y; 

our $w = 42;

set_x(1234556);
print "xm:$x\n";
get_x;
