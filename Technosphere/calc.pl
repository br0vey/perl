#!/usr/bin/perl
 use strict;
my @m;
my $token_count;
my $var1;
my $var2;
my $var3;
my @mm;
my @rpn;
my @rpnst;
my @stack;
my $znak;
my $elem;
my $x;
my %inoppr;
my %stkoppr;

$var1 = "- 16 + 2 * 0.3e+2 - .5 ^ ( 2 - 3 )";
#%inoppr = ('(','99', ')', 1, '+', '4', '-', '4', '*', '9','/', '9', '**', '15');  
%inoppr = (
       '(' => '99',
       ')' => '1',
       '+' => '4',
       '-' => '4',
       '*' => '9',
       '/' => '9',
      '**' => '15',    
);

%stkoppr = (
       '(' => '2',
#      ')' => '2',
       '+' => '5',
       '-' => '5',
       '*' => '11',
       '/' => '11',
      '**' => '14',
);


#%stkoppr = ('(' , '2','+', '5', '-', '5', '*', '5', '/', '11', '**', '14');

@m = split(/ /, $var1);
foreach my $elem ( @m ) {
     if ($elem eq "^"){
     $elem = "**";
     } 
}
if ($m[0] eq "-"){
 $m[1] = $m[0] . $m[1];
 shift @m;
}

$var2 = join(" ",@m);

##########################RPN!!!111 begin
@mm = split(/ /, $var2);
foreach $elem (@mm) {
print "00_stack:@stack\n";
print "00_elem:$elem\n";
if ( $elem ~~ [keys(%inoppr)] ) {
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

           $token_count = 0;
           $elem=0+$elem;
           print "33_rpn:@rpn\n";        
           $token_count = 0;
           push ( @rpn, $elem );
           print "33_rpn:@rpn\n";
          }
     
}
###########################RPN!!!111 end
###########################RPN vichisleniya!!!111 begin

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
################################RPN calc end
################################vidod begin


print "stack:@stack\n";
print "m:@m\n";
print "mm:@m\n";
print "var:$var2\n";
print "rpn:@rpn\n";
$var3=eval ($var2);
print "---$var3---\n";
print "rpnst:@rpnst\n";
#############################vivdod end
