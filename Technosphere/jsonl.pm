#!/usr/bin/perl
package jsonl;
 use Exporter 'import';

 use JSON;
my $hash;
my $jsontext;
my $arrayref;
my $perl_scalar;

@EXPORT = qw(encode_jsonl decode_jsonl);

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