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
my $token_count;
my $var1;
my $var2;
my $var3;
my @mm;
my @rpn;
my @rpnst;
my @stack;
my @scobki;
my $znak;
my $minus;
my $plus;
my $step;
my $lscob;
my $rscob;
my $tmpv1;
my $elem;
my $token_count;
my $token;
my $pr1;
my $pr2;
my $pr3;
my $pr4;
my $x;
my $y;
my $z;
my $l;
my %inoppr;
my %stkoppr;
#my $tmpv;
#my $tmpv3;
#$plus = "+";
#$minus = "-";
#$step = "**";
#$lscob = "(";
#$rscob = ")";
#$proizv = "*";
#$tmpv=0;

$var1 = "- 16 + 2 * 0.3e+2 - .5 ^ ( 2 - 3 )";
#$var1 = "2 + 3 * 4";
%inoppr = ('(','99', ')', 1, '+', '4', '-', '4', '*', '9','/', '9', '**', '15');  
%stkoppr = ('(' , '2','+', '5', '-', '5', '*', '5', '/', '11', '**', '14');

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
#$token_count = 0;
foreach $elem (@mm) {
print "00_stack:@stack\n";
print "00_elem:$elem\n";
if ( $elem ~~ [keys(%inoppr)]) {
     $token_count = 1;
     while ( @stack ) {
         $znak = $stack[$#stack];
         print "wstack:@stack\n";
         print "wznak:$znak\n";
         print "w_>:$stkoppr{$znak}>$inoppr{$elem}\n";
         
         
          if ($stkoppr{$znak} > $inoppr{$elem}) {
           print "w_>:$stkoppr{$znak}>$inoppr{$elem}\n";   
           push ( @rpn, $znak);
          pop @rpn if ($znak eq "("); 
           print "w_rpn:@rpn\n";
           pop @stack ;
         }
         else { last }
}
      
     push ( @stack, $elem );


  }

      else {
#if ($stack[-1] eq "("){
#      pop @stack;
#}
      $token_count = 0;
      $elem=0+$elem;
      print "33_rpn:@rpn\n";        
      $token_count = 0;
      push ( @rpn, $elem );
      print "33_rpn:@rpn\n";
      }
     # $step = 1 if ( $elem eq "(" );
}
###########################RPN!!!111
###########################RPN vichisleniya!!!111

foreach $elem (@rpn) {
print "rpnst:@rpnst\n";
print "03_elem:$elem\n";
       if ( $elem ~~ [keys(%inoppr)]) {
      push (@rpnst, pop(@rpnst) + pop(@rpnst) )   if ($elem eq "+"); 
      if ($elem eq "*") {
        $x = pop(@rpnst);
         push (@rpnst, pop(@rpnst) * $x );
      }
      if ($elem eq "-") {
        $x = pop(@rpnst); 
         push (@rpnst, pop(@rpnst) - $x );
      }                          
      if ($elem eq "**") {
        $x = pop(@rpnst);
         push (@rpnst, pop(@rpnst) ** $x );
      }
      if ($elem eq "/") {
        $x = pop(@rpnst);
        push (@rpnst, pop(@rpnst) / $x );
      }

      print "rpnst:@rpnst\n";
       }
       else {

           print "33_rpn:@rpnst\n";
           $token_count = 0;
           push ( @rpnst, $elem );
           print "33_rpn:@rpnst\n";
      }


}



print "stack:@stack\n";
print "m:@m\n";
print "mm:@m\n";
print "var:$var2\n";
print "rpn:@rpn\n";
print "scobki:@scobki\n";
$var3=eval ($var2);
print "---$var3---\n";
print "rpnst:@rpnst\n";
