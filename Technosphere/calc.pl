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
$var1 = "- 16 + 2 * 0.3e+2 - .5 ^ ( 2 - 3 )";
my @m;
@m = split(/ /, $var1);
foreach my $elem ( @m ) {
#print "+++$elem++\n";    
     if ($elem eq "^"){
     $elem="**";
     } 
#здесь можно поработать с символом, который хранится в $1
}
$var2= join("",@m);
#print "qq$m[0]qq\n";
#print "qq$m[1]qq\n";
#print "qq$m[2]qq\n-";
print "@m\n";
print "$var2\n";
$var3=eval ($var2);
print "---$var3---\n";

