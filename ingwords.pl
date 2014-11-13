use strict; 
use warnings; 

# @author   Sam Taylor <samuel.taylor@yale.edu>
# @version  1.0
# @since  2014-11-11
# This is a program that compares a recent article from a conservative
# news source to a text file of the user's choosing. The program sifts
# through the text files and records instances of -ing words then displ-
# -ays them to the user. I thought it might be interesting to see how 
# language between conservative and liberal news sites differed with re-
# -gards to the same story.

open(FILE, "sampletext.txt") || die "Can't open: $! \n";
my @raw=<FILE>;
my $count=1;
foreach (@raw){
my @arr=split(/\s+/,$_);
foreach my $elem (@arr){
	#if ($elem =~ m/^M/){ print "$elem\n";} #finds the words that start with M
	if ($elem =~ m/ing$/){
	print "\t$count:\t$elem\n";
	$count++;
	} 
}
}
close FILE;

print "Enter the filename: "; #try sampletext2.txt
my $infile = <>;
open(FILE, $infile) || die "Can't open: $! \n";
my $cnt=1;
while (my $line=<FILE>){
	my @words=split(/\s+/, $line);
	foreach (@words){
		if (/ing/){
			print "$cnt: $_\n";
			$cnt++;
			}
		}
	}			
close FILE;


