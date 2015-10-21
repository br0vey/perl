#!/usr/bin/perl
package setgetm;
 use strict;
 use warnings;
 use setget qw(x y w);
our $x;
our $y; 
our $w;
$x = 42;
$y = 75;
$w = 333;
print get_x();
print "get_\n";
print get_y();
print "\n";
print "set_get:\n";
set_x(456);
print get_x();
print "_______\n";
print "set_get:\n";
set_y(234234);
print get_y();
print "\n";
print get_w();
print "\n";
set_w(444444444444);
print get_w();
print "\n";


