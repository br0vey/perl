#!/usr/bin/perl

package currency;
 use Exporter 'import';

my $rurexc;
my $cnyout;
my $gpbin;
my $rurout;
my $key;
my $value;
my $usdin;
#my $rur;
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
