#!/usr/bin/perl 
 package jsonl;
 use strict;
 use warnings;
 use Exporter 'import';
 use JSON;
our @EXPORT;
@EXPORT = qw(decode_jsonl encode_jsonl);


sub decode_jsonl {
   my $hashout;
   my $jsontextin; 
   my @tmparr;
   my $elem;
   @tmparr = @_;
   $tmparr[$#tmparr] =~ s/\n/,/g;
   ($jsontextin) = @tmparr;
   $hashout = decode_json($jsontextin);
   return $hashout;
}

sub encode_jsonl{
   my $elem;
   my $perl_scalarin;
   my $jsontextout;;
   ($perl_scalarin) = @_;
   $jsontextout = JSON->new->utf8->encode($perl_scalarin);
   #print "jsontext:$jsontext\n";
   $jsontextout =~ s/,{"/\n{"/g;
   return $jsontextout;
}
1;
