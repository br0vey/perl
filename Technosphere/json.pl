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
my %hash1;
my %hash2;
my %hash3;
my @data;

@data=(\%hash1, \%hash2, \%hash3);

%hash1 = (
       'month' => 3,
       'year' => 2017,
       'days' => 3,
);
%hash2 = (
       'month' => 5,
       'year' => 2014,
       'days' => 654,
);

%hash3 = (
       'month' => 8,
       'year' => 2007,
       'days' => 56,
);


$array_ref=\@data;
$string = encode_jsonl($array_ref);
print "string:$string\n";

$array_ref = decode_jsonl($string);
print  Dumper($array_ref); 

