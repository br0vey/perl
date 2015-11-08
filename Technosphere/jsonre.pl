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
        if ( $elem =~ m/"(\w+\d+)":\s(-\d+\.\d+),$/ ) {
               print "1:$1\n";
                 print "2:$2\n";
             
            $hashout{$1} = $2;
        }
           if ( $elem =~ m/"(\w+\d+)":\s(\d+.\d+),$/ ) {
               print "1:$1\n";
                 print "2:$2\n";

            $hashout{$1} = $2;
        }




        if ( $elem =~ m/"(\w+\d+)":\s"(.+)",$/) {
     
                 print "21:$1\n";
                 print "strval:$2\n";
 
           $hashout{$1} = $2;
        }
    #    if ( $elem =~ m/"(\w+\d+)":\s\["(.+)"\],/) {
            if ( $elem =~ m/"(\w+\d+)":\s\["(.+)"\],$/) {
              my @jsarr = split ( /,/, $2 );                     
              for my $ent (@jsarr) {
                 $ent =~ s/"//g;
             }
               print "jsa:@jsarr\n";
               $hashout{$1} = \@jsarr; 
            }
     #   }
     
     #  if ( $elem =~ m/"(\w+\d+)":\s{\s"(.+)":\s"(.+)"\s},/ ) {
          if ( $elem =~ m/"(\w+\d+)":\s{\s(.+)\s},$/ ) {         
           print "2:$2\n";  
           my @jsarr = split ( /,\s/, $2 );
          print "jsa:@jsarr\n";
          my %jsonhashin;
          for my $ent (@jsarr) {
                 $ent =~ m/"(.+)":\s"(.+)"/;
                 print "1:$1\n";
                 print "2:$2\n";
                 $jsonhashin{$1}  = $2;
          } 

  
        #   my %jsonhashin;
#            $jsonhashin{$2}  = $3;
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

