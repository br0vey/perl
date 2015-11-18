#!/usr/bin/perl
use strict;
use warnings;
use DDP;

sub decode_json {
    my %hashout;
    my $data = shift;
    my @tmparr = ( split /,/, $data );
    print "data:@tmparr\n";
    print "data:$tmparr[1]\n";

    while (@tmparr) {
        my $elem = shift @tmparr;
        if ( $elem =~ m/"(\w+\d+)":\s(-\d+\.\d+)$/ ) {
            $hashout{$1} = $2;
        }
        if ( $elem =~ m/"(\w+\d+)":\s(\d+.\d+)$/ ) {
            $hashout{$1} = $2;
        }

        if ( $elem =~ m/"(\w+\d+)":\s"(.+)"$/ ) {
            $hashout{$1} = $2;
        }
        if ( $elem =~ m/"(\w+\d+)":\s\[(.+)\]$/ ) {
            print "2:$2\n";
            my @jsarr = split( /,/, $2 );
            for my $ent (@jsarr) {
                $ent =~ s/"//g;
            }
            $hashout{$1} = \@jsarr;
        }
        if ( $elem =~ m/"(\w+\d+)":\s{\s(.+)\s}$/ ) {

            my @jsarr = split( /,\s/, $2 );
            my %jsonhashin;
            for my $ent (@jsarr) {
                $ent =~ m/"(.+)":\s"(.+)"/;
                $jsonhashin{$1} = $2;
            }

            $hashout{$1} = \%jsonhashin;
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

