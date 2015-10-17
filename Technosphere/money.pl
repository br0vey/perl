#!/usr/bin/perl
BEGIN { $Exporter::Verbose=1 }
my $rur;
my $cny;
my $crn;

 use currency qw(set_rate);
# use lib 'currency.pm'

set_rate(
         cny => 100,
         rur => 61.40 
         );

$crn = "rur";
my $rur = currency::usd_to_rur(42);
print "rur:$rur\n";
$crn= "cny";
my $cny = currency::gbp_to_cny(2);
print "cny:$cny\n";



x
