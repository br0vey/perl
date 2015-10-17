#!/usr/bin/perl
BEGIN { $Exporter::Verbose=1 }
my $rur;
my $cny;
# use currency qw(set_rate);
 use currency qw(set_rate);
#set_rate {
# our %cur = (
#        usd => 2342341,
#        rur => 65.44,
#        eur => 1.2,
#       );
# our $w = 1345;
#}

set_rate(
         cny => 342,
         rur => 61.40 
         );

my $rur = currency::usd_to_rur(42);
print "rur:$rur\n";
my $cny = currency::gbp_to_cny(2);
print "cny:$cny\n";



#print currency::rur_to_cny(3);
##currency::rur_to_cny;
#print "$x\n";

#$rurr = currency::rur_to_cny(42);
#print "111111111fgd"
