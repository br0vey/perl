#!/usr/bin/perl

package currency;
 use Exporter 'import';

my $rurexc;
my $cnyexc;
my $cnyout;
my $gbpin;
my $rurout;
my $key;
my $value;
my $usdin;
my $cnyout;
my %args;

@EXPORT = qw(set_rate);

sub set_rate {
%args = (
         @_ # Список пар аргументов
         );
#my (@t) = keys(%args);
#print "@t\n"; 
#my ($usd, $cny) = @_;

#my $r = 2 * $cny;
#print "$r\n";
}



sub gbp_to_cny($) {
   while ( ($key, $value) = each(%args) ) {
#        print "$key 00=>00 $value\n";
        if ( $key eq "cny" ) {
          $cnyexc = $value;
          print "cnyexc:$cnyexc\n";
        } 
   }
($gbpin) = @_;
print "gbpin:$gbpin\n";
$cnyout = $cnyexc * $gbpin;
print "$cnyexc * $gbpin\n";
return $cnyout;
}

sub usd_to_rur($) {
   while ( ($key, $value) = each(%args) ) {
#        print "$key 00=>00 $value\n";
        if ( $key eq "rur" ) {
          $rurexc = $value;
          print "rurexc:$rurexc\n";
        }
   }
($usdin) = @_;
print "usdin:$usdin\n";
$rurout = $rurexc * $usdin;
print "$rurexc * $usdin\n";
return $rurout;
}





1;
