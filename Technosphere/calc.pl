#!/usr/bin/perl
 use strict;
#$| = 1;
#while (1) {
#print "Please enter your expression (or 'exit' to exit): ";
#chomp(my $cmd = <>);
#exit if ($cmd =~ /^\s*exit\s*$/);
#my $result = eval "$cmd";
#print "Result = $result\n\n";
#}
my @m;
my $var1;
my $var2;
my $var3;
my @mm;
my @rpl;
my @stack;
my $plus;
my $minus;
my $step;
my $lscob;
my $rscob;
my $proizv;
my $elem;
$plus = "+";
$minus = "-";
$step = "**";
$lscob = "(";
$rscob = ")";
$proizv = "*";
$var1 = "- 16 + 2 * 0.3e+2 - .5 ^ ( 2 - 3 )";
@m = split(/ /, $var1);
foreach my $elem ( @m ) {
#print "+++$elem++\n";    
     if ($elem eq "^"){
     $elem = "**";
     } 
}
if ($m[0] eq "-"){
 $m[1] = $m[0] . $m[1];
 shift @m;
}
print ">>>$m[1]<<<\n";
$var2 = join(" ",@m);
#print "qq$m[0]qq\n";
#print "qq$m[1]qq\n";
#print "qq$m[2]qq\n-";
if ($m[0] eq "-"){
 $m[1] = $m[0] . $m[1];
 shift @m;
}

###########################RPN!!!111
@mm = split(/ /, $var2);
foreach $elem ( @mm ) {
     print "+++$elem++\n";
     if ( $elem ~~ [ "+", "-", "*", "(", ")", "**"] ) {
# || $minus ){
##  || $lscob || $rscob || $proizv ){ 
     push @stack, $elem ;
     }

}
print "stack:@stack\n";
print "massiv:@m\n";
print "var:$var2\n";
$var3=eval ($var2);
print "---$var3---\n";

