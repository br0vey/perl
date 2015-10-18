#!/usr/bin/perl
 use strict;
 use warnings;

package currency;
 use Exporter 'import';

my $cexc;
my $cout;
my $cin;
my $key;
my $value;
my %args;
my @m;
our $AUTOLOAD;

@EXPORT = qw(set_rate);

sub set_rate {
%args = ( @_ );
}

sub AUTOLOAD {
my $program = $AUTOLOAD;
@m= split(/_/, $program);
$crn=$m[$#m];
print "$crn\n";
   while ( ($key, $value) = each(%args) ) {
        if (  $crn eq $key ) {
          $cexc = $value;

          print "_exc:$cexc\n";
        }
   }
($cin) = @_;
#print "gbpin:$gbpin\n";
$cout = $cexc * $cin;
print "$cexc * $cin\n";
return $cout;
}
1;
