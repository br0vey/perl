#!/usr/bin/perl
 use strict;
 use warnings;

package currency;
 use Exporter 'import';

my $cexc;
my $cout;
my $cin;
my $key;
my $crn;
my $value;
my %args;
my @m;
our @EXPORT;
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
$cout = $cexc * $cin;
print "$cexc * $cin\n";
return $cout;
}
1;
