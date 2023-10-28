use strict;
use warnings;
use Data::Dumper;

#configuration
my $vanSpaces = 5;
my $carSpaces = 5;
my $bikeSpaces = 3;

our %spaces = (
	#tracking free parking spots per vehichle type
	'Van' => 0,
	'Car' => 0,
	'Bike' => 0,
);

sub park {
	my ($type) = @_;
	$spaces{$type}++;
#	print Dumper(\%spaces);
}

sub leave {
	my ($type) = @_;
	$spaces{$type}--;
#	print Dumper(\%spaces);
}

sub displayStats {
#MATH
	our $vanNum = $vanSpaces - $spaces{'Van'};
	our $carNum = $carSpaces - $spaces{'Car'};
	our $bikeNum = $bikeSpaces - $spaces{'Bike'};

#UX
	print "\n\nHello and welcome to Parking Simulator!\n\n";
	print "We currently have room for $vanNum vans, $carNum cars, and $bikeNum bikes.\n"; 
	
}

sub testSub {
	my ($type) = @_;
	return($type);
}

#print Dumper(\%spaces);

sub main {
	displayStats();
	#lets declare some variables
	my $choice1;
	my $choice2;

	print "Are you here to park or leave?\n";
	$choice1 = <>;
	chomp($choice1);
	
	if ($choice1 =~ 'park') { 
		print "Oh this is wonderful! We're here for parkers, what vehicle do you have; Car, Van, or Bike?\n";
		$choice2 = <>;
		chomp($choice2);
		park($choice2);
		};

	if ($choice1 =~ 'leave') {
		print "Now you're a driver and not a parker. Ugh, what kind of vehicle do you have, Car Van or Bike?\n";
		$choice2 = <>;
		chomp($choice2);
		leave($choice2);
		};
};

# while(1) {main();}


#make a parking lot spot tracker, track big spots and small spots available.

#I dont need a class for a single parking lot, but i will for two
#
#
#
#
#
#
#
#
#
#
