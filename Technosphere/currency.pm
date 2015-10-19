#!/usr/bin/perl
package currency;
 use strict;
 use warnings;
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
@m= split(/_/, $AUTOLOAD;);
$crn=$m[$#m];
#print "$crn\n";
#   while ( ($key, $value) = each(%args) ) {
#        if (  $crn eq $key ) {
#          $cexc = $value;

#          print "_exc:$cexc\n";
#        }
#   }
($cin) = @_;
$cout = $args{$crn} * $cin;
print "$args{$crn} * $cin\n";
return $cout;
}
1;
