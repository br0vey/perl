#!/usr/bin/perl 
 package jsonl;
 use strict;
 use warnings;
 use Exporter 'import';
 use JSON;
my $hash;
my $jsontext;
my $arrayref;
my $perl_scalar;
our @EXPORT;
@EXPORT = qw(decode_jsonl encode_jsonl);


sub decode_jsonl {
    ($jsontext) = @_;
    $hash = decode_json($jsontext);
    return $hash;
}

sub encode_jsonl{
    ($perl_scalar) = @_;
    $jsontext = JSON->new->utf8->encode($perl_scalar);
    return $jsontext;
}
1;
