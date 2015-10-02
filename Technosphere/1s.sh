 ls -l | perl -nlae '$fn++; $mb++, print "$_\n", if $F[4]>1048576; END{print "1Mb $mb\n"; print "number_of_files: $fn\n"}'
