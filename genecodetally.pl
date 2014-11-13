use strict; 
use warnings; 

# @author   Sam Taylor <samuel.taylor@yale.edu>
# @version  1.0
# @since  2014-11-11
# This is a program that generates a random genetic sequence then
# analyses that sequence to find the number and location of stop
# codons, and to tally the various nucleic acids.

sub main
{
my $length = int(40 + rand(1000));

my $seq="";

for (my $i=0;$i<$length;$i++){
	my $base = int(rand(4));
	if ($base ==0) {$seq .= 'a'; next;}
	if ($base ==1) {$seq .= 'c'; next;}
	if ($base ==2) {$seq .= 't'; next;}
	if ($base ==3) {$seq .= 'g'; next;}
}

print "Sequence($length): $seq\n";

my $cnt=0;
my $acnt=0;
my $ccnt=0;
my $tcnt=0;
my $gcnt=0;
my $where=-3;
my @words=split(/atg/, $seq);
foreach (@words){
	$cnt++;
	$acnt++;
	$tcnt++;
	$gcnt++;
	$where+=(length($_)+3);
	if ($where <$length) {print "STOP at: ". $where. "\n";}
	for (my $i=0;$i<length($_);$i++){
	my @string = split //, $_;
		if ($string[$i] eq'a') {$acnt++; next;}
		if ($string[$i] eq'c') {$ccnt++; next;}
		if ($string[$i] eq't') {$tcnt++; next;}
		if ($string[$i] eq'g') {$gcnt++; next;}
}
}
print "Total stop codons: " .($cnt-1). "\n";
print "Total a:	" .$acnt."\n";	
print "Total c:	" .$ccnt."\n";	
print "Total t:	" .$tcnt."\n";	
print "Total g:	" .$gcnt."\n";	
}
main();
