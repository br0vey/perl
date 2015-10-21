#@EXPORT = qw(xx yy zz);
#!/usr/bin/perl
package setget;
 use strict;
 use warnings;

no strict 'refs';
sub  import {
    my $elem;
    print "mmm:@_\n";
    my $package = shift;
    my ($callerpkg, $file, $lineno) = caller;
    foreach $elem (@_){
           *{"${callerpkg}::get_$elem"} = sub {
             return ${$callerpkg . "::" . $elem};
           };
          *{"${callerpkg}::set_$elem"} = sub {
             (${"${callerpkg}::$elem"}) = @_ ;
            return ${$callerpkg . "::" . $elem};
           };
    }
}
1;

