#!/usr/bin/perl
use strict;
use warnings;
use DDP;

sub decode_json {
    my %hashout;
    my $data = shift;
    my @tmparr = ( split /\n/, $data );
    while (@tmparr) {
        my $elem = shift @tmparr;
        if ( $elem =~ m/"(\w+\d+)":\s(.+),/ ) {
            $hashout{$1} = $2;
        }
        if ( $elem =~ m/"(\w+\d+)":\s"(.+)",/ ) {
            $hashout{$1} = $2;
        }
        if ( $elem =~ m/"(\w+\d+)":\s\["(.+)"\],/ ) {
            if ( $elem =~ m/"(\w+\d+)":\s\["(.+)",.+"\],/ ) {
            print "2:$2\n";
            }
            my @array;
            push @array, $2;
            $hashout{$1} = \@array;
        }
        if ( $elem =~ m/"(\w+\d+)":\s{\s"(.+)":\s"(.+)"\s},/ ) {
            my %hashin;
            $hashin{$2}  = $3;
            $hashout{$1} = \%hashin;
        }
    }
    return \%hashout;
}

my $data = do {

    #чтение файла
    open my $f, '<:raw', $ARGV[0]
      or die "open `$ARGV[0]' failed: $!";
    local $/;
    <$f>;
};
my $struct = decode_json($data);
p $struct;

