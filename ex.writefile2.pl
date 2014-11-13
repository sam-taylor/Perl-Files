use strict; 
use warnings; 

# @author   Sam Taylor <samuel.taylor@yale.edu>
# @version  1.0
# @since  2014-10-14
# This is a program that asks the user for strings to write to a file.
# The program then reads the file just made and writes the strings in
# reverse to a new file and printing the results. This was practice for
# managing multiple files.

sub main
{
open(FILE, ">data.dat") || warn "Can't open: $! \n";
for (my $i=0; $i<10; $i++){
	print "Please enter a string.\n";
	my $string = <>;
	if (! print FILE $string){
		warn "Can’t write to the file!";
		close FILE;
		last;
	}
	else{
	print "You entered: $string";
	}
}
close FILE;
open(FILE, "data.dat") || warn "Can't open: $! \n";
open(FILE2, ">data2.dat") || die "Can't open: $! \n";
my @list=<FILE>;
for (my $x=0; $x<=@list; $x++){
	my $string2 = reverse $list[$x];
	print FILE2 $string2;
	print FILE2 "\n";
	#print reverse $list[$x];
	#print $list[$x];
}
close FILE2;
open(FILE2, "data2.dat") || die "Can't open: $! \n";
my @list2=<FILE2>;
print @list2;
close FILE2;
close FILE;
}
main();
