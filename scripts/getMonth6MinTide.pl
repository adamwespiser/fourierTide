#!/usr/bin/perl
use strict;
use warnings;

use Getopt::Long;

my($month,$year,$dir);
GetOptions('m=s'=>\$month,
'y=s'=>\$year,
'd=s'=>\$dir
)or&usage;


if($month<10){
$month="0".$month;
}else{
$month="".$month;
}

print "month is ${month}\n";

my%hash=('01','31','02','28','03','31','04','30','05','31','06','30','07','31','08','31','09','30','10','31','11','30','12','31');

my$leap_year=0;

if($year%400==0){
$leap_year=1;
}elsif($year%100==0){
$leap_year=0;
}elsif($year%4==0){
$leap_year=1;
}else{
$leap_year=0;
}

my $day="-";

if($month=='02'and$leap_year==1){
$day="29";
}else{
$day=$hash{$month};
}

my $bdate="${year}${month}01";
my $edate="${year}${month}${day}";
my $url="http://tidesandcurrents.noaa.gov/data_menu.shtml?bdate=${bdate}&edate=${edate}&wl_sensor_hist=W1&relative=&datum=6&unit=1&shift=g&stn=9410660+Los+Angeles%2C+CA&type=Historic+Tide+Data&format=View+Data";

my $outfile="${dir}/${year}_${month}.txt";

print "$url\n";

my $outfile_temp = $outfile."_temp";
my $command = "wget \"${url}\" -O ${outfile_temp}";

open (my $cmd,"$command | ");
while(<$cmd>){
  print ".";
	}
	print "\n";



my $command2 = "grep \"^9410660\" $outfile_temp > $outfile &&  rm $outfile_temp";
open (my $cmd2, "$command2 |");
while(<$cmd2>){
  print ".";
	}
	print "\n";







