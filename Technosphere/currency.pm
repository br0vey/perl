#!/usr/bin/perl
package currency;
 use strict;
 use warnings;
 use Exporter 'import';

my $cexc;
my $cout;
my $cin;
my $cto;
my $cfr;
my %args;
my $cinusd;
our @EXPORT;
our $AUTOLOAD;

@EXPORT = qw(set_rate);

sub set_rate {
%args = ( @_ );
}

sub AUTOLOAD {
   if ($AUTOLOAD =~ m/\w+\::(\w\w\w)\_\w+\_(\w\w\w)\b/) {
     $cfr=$1;
     $cto=$2;
   }
   ($cin) = @_; 
   $cinusd = $cin * $args{$cfr};
#   print "usd:$cinusd = $cin * $args{$cfr}\n ";
   $cout = $args{$cto} * $cinusd;
#   print "$args{$cto} * $cinusd\n";
   return $cout;
}
1;
