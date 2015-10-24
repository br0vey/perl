#!/usr/bin/perl
 use strict;
 use warnings;
 use Data::Dumper;
 use jsonl qw(
     decode_jsonl
     encode_jsonl
     );
#@data=(\%hash1, \%hash2, \%hash3);

#@data=({ k => "test},{test"}, hash1, { k => "test},{test"},\%hash2);

#my @data=({a => 1}, {b => 2});
my @days=(3,4,6,8,9,5);
my %hash1 = (
       'month' => 3,
       'year' => 2017,
       'days' => \@days,
);
my %hash2 = (
       'month' => 5,
       'year' => 2014,
       'days' => 654,
);

my %hash3 = (
       'month' => 8,
       'year' => 2007,
       'days' => 56,
);
my @data=({ k => "X\n"}, { y => "test},{test"},[1,2,3],{ y => "test},{test"},[8,6,4],{ y => "test},{test"},[5,6,7],[5,6,7], { y => "test},{test"},\%hash1,[11,56,67],\%hash1, { w => "test},{test"});
#@data =qq(@data)

#my $string = encode_jsonl([
#    {a => 1},
#    {b => 2},
#]);
my $string = encode_jsonl(\@data);
print "string:$string\n";

my $arrayref = decode_jsonl($string);
print  Dumper($arrayref); 

my $string = encode_jsonl($arrayref);
print "string:$string\n";
