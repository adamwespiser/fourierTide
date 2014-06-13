#!/usr/bin/perl

my $combFile = $dir."/tidesNYC.tab";

my $dir = "../data";
my $yearStart = 1996;
my @months = (1..12);


foreach my $year($yearStart..2012){
	foreach my $month (@months){
		print "${year} ${month}\n"; 
		my $command = "perl getMonth6MinTide.pl -m ${month} -y ${year} -d ${dir}";
		print $command."\n";
		open (my $cmd2, "$command |");
		while(<$cmd2>){
				print ".";
		}
		print "\n";
		
	}
}	

foreach my $year($yearStart..2012){
	foreach my $month (@months){
		print "${year} ${month}\n"; 
		my $file = "${dir}/${year}_${month}.txt";
		my $command2 = "cat $file >> $combFile";
		print $command2."\n";
		open (my $cmd2, "$command2 |");
		while(<$cmd2>){
			print ".";
		}       
		print "\n";
	}
} 




