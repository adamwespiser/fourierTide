#!/usr/bin/perl
#

my $dir = "../data/";
my $file = "${dir}/NYC_6min.tab";

foreach my $year (1996..2012){
 my $cmd =  "ls ${dir} | grep ${year} | xargs -I{} cat ${dir}/{} > ${dir}${year}";
 system($cmd);
 }
 
foreach my $year (1996..2012){
	my $cmd = "cat ${dir}${year} >> ${file}";
 system($cmd);
}
