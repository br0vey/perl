#!/usr/bin/perl 
 package jsonl;
 use strict;
 use warnings;
 use Exporter 'import';
 use JSON;
our @EXPORT;
@EXPORT = qw(decode_jsonl encode_jsonl);

sub decode_jsonl {
#@_;
my $tmpp = shift;
#   my tmparr = @_;
   $tmpp =~ s/\n/,/g;

#   ($jsontextin) = @tmp;
 my  $hashout = decode_json($tmpp);
   return $hashout;
}

sub encode_jsonl{
# my $elem;
my ($ar) = @_;
print "ar:@$ar\n";
my ($arr) =  @$ar;
print "arr:$arr\n";
my @m;
#@m = shift @$ar;
#print "m:@m\n";
my   ($perl_scalarin) = @_;
#print "m:@{$perl_scalarin}\n";
#my   $jsontextout = JSON->new->utf8->encode(@$ar);
my   $jsontextout = encode_json($perl_scalarin);
#my   $jsontextout = encode_json(@$ar);
#$my   $jsontextout = JSON->new->utf8->encode(@$ar);
   print "jsontextout:$jsontextout\n";
   $jsontextout =~ s/(?<="}),(?=[[])/\n/g;
   $jsontextout =~ s/(?<=[]]),(?=[[])/\n/g;
   $jsontextout =~ s/(?<=[]]),(?={")/\n/g;
   $jsontextout =~ s/(?<="}),(?={")/\n/g;
   $jsontextout =~ s/(?<=}),(?={")/\n/g;
   $jsontextout =~ s/(?<="}),(?={)/\n/g;  
   $jsontextout =~ s/(?<=}),(?=[[])/\n/g;
   return $jsontextout;
}
1;
