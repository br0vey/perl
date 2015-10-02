 cat 2.txt | perl -F: -nlae '$str++;$stb=0;foreach my $q (@F){$stb++; print "stobets:$stb\n stroka:$str\n", if $q>10;}'
