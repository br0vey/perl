#!/usr/bin/perl 
 package jsonl;
 use strict;
 use warnings;
 use Exporter 'import';
 use JSON;
our @EXPORT;
@EXPORT = qw(decode_jsonl encode_jsonl);
our $tr1 = 0;
sub decode_jsonl {
   my $tmpp = shift;
   print "tmpp:$tmpp\n";
   $tmpp =~ s/\n/,/g;
   $tmpp =~  s/\\\\n/\\n/g;
   my  $hashout = decode_json($tmpp);
   return $hashout;
}

sub encode_jsonl{
   my ($elem)=shift;
   my @mm = @$elem;
   my $strout = "";
   my $str = "[";
   my $tr1 = 0;
   foreach my $em (@mm){
   #      $tr1 = 0; 
          $strout = $str;
          $str = encode_json($em);
#          print "str1:$str\n";
 #        $str = qq($str);
#          $str =~ s/\\\\n/\\n/g if $tr1 == 0; 
  #        print "str4:$str\n";
#          if ($str =~ s/\\\\n/\\n/g){
#            $tr1 = 1;
#          }
          $str =~ s/(?<=\w)\\n/\\\\n/g if $tr1 == 0;               
 #         print "str2:$str\n";
    #      $str =~ s/\\\\n/\\n/g if $tr1 = 1;
  #        print "str7:$str\n";
          $str = $strout . $str . "\n" ;
   }
chop $str;
$str = $str . "]"; 
return $str;
}
1;
