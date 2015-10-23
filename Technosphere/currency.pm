#!/usr/bin/perl
package currency;
 use strict;
 use warnings;
 use Exporter 'import';


our @EXPORT;
our $AUTOLOAD;
our %args;
@EXPORT = qw(set_rate);

sub set_rate {
   %args = ( @_ );
}

sub AUTOLOAD {
   my $cexc;
   my $cout;
   my $cin;
   my $cto;
   my $cfr;
   my $cinusd;
   if ($AUTOLOAD =~ m/\w+\::(\w\w\w)\_\w+\_(\w\w\w)\b\z/) {
     $cfr=$1;
     $cto=$2;
   }
   else {
       die "error";
   }      
   ($cin) = @_; 
   $cinusd = $cin * $args{$cfr};
#   print "usd:$cinusd = $cin * $args{$cfr}\n ";
   $cout = $args{$cto} * $cinusd;
#   print "$args{$cto} * $cinusd\n";
   return $cout;
}
1;
