#!/usr/bin/perl
 use strict;
 use warnings;
use DDP;
my %hashout;
#my @mmm;
#my $ar;
sub decode_json {
my @mm;
my $data = shift;
print "data:$data\n"; # To be done
#my %hashout;
#return $ref;
@mm = (split /\n/,$data);
while (@mm){
#  chomp  $data;
#print "mm:@mm\n";
#print "data:$data\n";
#     if ( $data =~ m/^{/){

my $elem = shift @mm;
 print "elem:$elem\n";
    $elem =~ m/"(\w+\d+)":\s(.+),/;
     $hashout{$1} = $2;
      if ($elem =~ m/"(\w+\d+)":\s(\[.+\]),/) {
          $elem =~ m/"(\w+\d+)":\s\["(.+)"\],/;
            push my @mmm, $2;
            print "mmm:@mmm\n";
            $hashout{$1} = \@mmm;
      
      }
 p %hashout;
    # push @mm, $1;
    #  push @mm, $2;
     print "1:$1\n";
     print "1:$2\n";
 #    }
}
#print "1:@mm\n";
 p %hashout;
}

 my $data =do {
#чтение файла
open my $f,'<:raw',$ARGV[0]
or die "open `$ARGV[0]' failed: $!";
local $/; <$f>
};
my $struct = decode_json($data);
#p $struct;
