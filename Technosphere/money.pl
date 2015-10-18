#!/usr/bin/perl
BEGIN { $Exporter::Verbose=1 }
my $rur;
my $cny;
 use currency qw(set_rate);

set_rate(
         cny => 100,
         rur => 61.40 
         );

my $rur = currency::usd_to_rur(42);
print "rur:$rur\n";

my $cny = currency::gbp_to_cny(2);
print "cny:$cny\n";




