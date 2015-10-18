#!/usr/bin/perl
BEGIN { $Exporter::Verbose=1 }
 use strict;
 use warnings;
my $rur;
my $cny;
 use currency qw(set_rate);

set_rate(
         cny => 100,
         rur => 61.40 
         );

$rur = currency::usd_to_rur(42);
print "rur:$rur\n";

$cny = currency::gbp_to_cny(2);
print "cny:$cny\n";




