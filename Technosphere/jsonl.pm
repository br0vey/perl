#!/usr/bin/perl 
 package jsonl;
 use strict;
 use warnings;
 use Exporter 'import';
 use JSON;
our @EXPORT;
@EXPORT = qw(decode_jsonl encode_jsonl);

sub decode_jsonl {
   my $tmpp = shift;
   $tmpp =~ s/\n/,/g;
   my  $hashout = decode_json($tmpp);
   return $hashout;
}

sub encode_jsonl{
   my ($elem)=shift;
   my @mm = @$elem;
   my $strout = "";
   my $str = "[";
   foreach my $em (@mm){
          $strout = $str;
          $str = $strout . encode_json($em) . "\n" ;
}
chop $str;
$str = $str . "]"; 
return $str;
}
1;
