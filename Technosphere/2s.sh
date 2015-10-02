 cat 2.txt | perl -F: -nlae '$str++;$stb=0;foreach my $elem (@F){$stb++; print "stobets:$stb\n stroka:$str\n", if $elem>10;}'
