use strict;
use warnings;

sub countLines {
	my ($location) = @_;
	my $count = 0;

	opendir(DIR, $location) or die "Could not open $location\n";

	my @files = readdir(DIR);

	foreach my $file (@files){

		my $realFile = $location . "/" . $file;

		if(-f $realFile){

			open(INPUT,$realFile) or die "Could not open $realFile\n";
			<INPUT>;

			while(<INPUT>){
				chomp $_;
				$count = $count + 1;
			}

		}
		else{
			print "File is not a file\n";
		}
	}

	closedir(DIR);

	return $count;
}

sub main(){

	my $location = '/Users/dave/TEST';
	my $count = 0;

	$count = countLines($location);
	
	print $count . "\n";

	return 0;
}

main();