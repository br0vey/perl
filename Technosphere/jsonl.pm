#!/usr/bin/perl 
 package jsonl;
 use strict;
 use warnings;
 use Exporter 'import';
 use JSON;
our @EXPORT;
@EXPORT = qw(decode_jsonl encode_jsonl);


sub decode_jsonl {
   my $hash;
   my $jsontext; 
   my @m;
   my $elem;
   $_[$#_]=~s/}\n{/},{/g;
   ($jsontext) = @_;
   $hash = decode_json($jsontext);
   return $hash;
}

sub encode_jsonl{
   my $elem;
   my $perl_scalar;
   my $jsontext;;
   ($perl_scalar) = @_;
   $jsontext = JSON->new->utf8->encode($perl_scalar);
   $jsontext=~s/},{/}\n{/g;
   return $jsontext;
}
1;
