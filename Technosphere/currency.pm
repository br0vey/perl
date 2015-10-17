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
our $AUTOLOAD;

@EXPORT = qw(set_rate);

sub set_rate {
%args = (
         @_ # Список пар аргументов
         );
}

sub AUTOLOAD {
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
1;
