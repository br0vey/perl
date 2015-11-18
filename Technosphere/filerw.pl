#!/usr/bin/perl
use strict;
use warnings;
#my $fname = 'file.txt';
#my $fh;
open (my $fhw, ">>", "file.txt");
my @data = <STDIN>;
my $lnum = 1;
for my $ent (@data){
print $fhw "$lnum $ent";
$lnum++;
}
close($fhw);
open (my $fhr, "<", "file.txt");
while (<$fhr>){
$_ =~ s/\d+\s//;
print "line:$_\n";
}
#print $fh "data:@data";
close($fhr);
