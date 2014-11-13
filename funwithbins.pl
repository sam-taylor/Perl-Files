use strict;
use warnings;

# @author   Sam Taylor <samuel.taylor@yale.edu>
# @version  1.0
# @since  2014-10-24
# This is a program that generates random numbers then sorts these
# numbers into bins of a specified size. The output is a list of 
# bins with the number of instances within each bin represented by
# *'s. This was also an exercise to practice formatting print output.

sub part3b
{
print "please enter an integer bin size 1-1000.\n";
my $binsize = <>;
chomp $binsize;
my $q = 0;
my @tally = ();
until ($q >= 1000/$binsize){
	$tally[int($q)] = 0;
	$q++;
	}
my $i = 0;
print "please enter an integer number of iterations 50 - 1000.\n";
my $itns = <>;
chomp $itns;
until ($i >= $itns) {
		$i++;
		my $rand = int(rand(1000)) + 1;
		my $j =1;
		my $x=1;
		until ($j > (int(1000/$binsize)+1)){
			$x = $j-1;
			if ($rand <= $j*$binsize){
			$tally[int($x)]++;
			last;
			}
			else{
			$j++;
			next;
			}
		}
}
#print Dumper(\%tally) . "\n";
$i=0;
print "\n";
for my $i (0...$#tally){
print "\t";
printf "%06s", (1+($binsize*$i)) . " - ";
printf "%05s", $binsize*(1+$i). ":";
print  "\t"."*"x$tally[$i]. "\n";
}
}

part3b();
