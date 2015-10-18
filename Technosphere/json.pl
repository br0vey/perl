#!/usr/bin/perl
#use JSON;
use Data::Dumper;
 use jsonl qw(
encode_jsonl
decode_jsonl
);
my $string;
my $array_ref;
my %json_hash;
$json_hash{month}=12;
$json_hash{year}=2015;
my @days=(8,10,16,19,25,67);
$json_hash{days}=\@days;


#my $json = JSON->new->allow_nonref;
#my $json_text=$json->encode(\%json_hash );
#print "$json_text\n";
#$array_ref = decode_json($json_text);

$string = encode_jsonl(\%json_hash);
print "string:$string\n";

$array_ref = decode_jsonl($string);
print  Dumper($array_ref); 

