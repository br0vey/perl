#!/usr/bin/perl
 use strict;
 use warnings;
 use Data::Dumper;
 use jsonl qw(
     decode_jsonl
     encode_jsonl
     );
my $string;
my $array_ref;
my %json_hash;
my @days;
$json_hash{month}=12;
$json_hash{year}=2015;
@days=(8,10,16,19,25,67);
$json_hash{days}=\@days;

$string = encode_jsonl(\%json_hash);
print "string:$string\n";

$array_ref = decode_jsonl($string);
print  Dumper($array_ref); 

