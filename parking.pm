use strict;
use warnings;
use Data::Dumper;

#configuration
my $vanSpaces = 5;
my $carSpaces = 5;
my $bikeSpaces = 3;

my @allowedWords = (
	'Car',
	'Van',
	'Bike',
	'park',
	'leave'
);
our %spaces = (
	#tracking free parking spots per vehichle type
	'Van' => 0,
	'Car' => 0,
	'Bike' => 0,
);

sub park {
	our ($type) = @_;
	$spaces{$type}++;
}

sub leave {
	our ($type) = @_;
	$spaces{$type}--;
#	print Dumper(\%spaces);
}

sub displayStats {
#MATH
	our $vanNum = $vanSpaces - $spaces{'Van'};
	our $carNum = $carSpaces - $spaces{'Car'};
	our $bikeNum = $bikeSpaces - $spaces{'Bike'};

#UX
	#print Dumper(\%spaces);
	print "\n\nHello and welcome to Parking Simulator!\n\n";
	print "We currently have room for $vanNum vans, $carNum cars, and $bikeNum bikes.\n"; 
	
}

sub testSub {
	our ($type) = @_;
	return($type);
}

sub verifyInput {
	our ($userInput) = @_;
	my $matched = 0;
	my $filteredWord;
	foreach my $word (@allowedWords) {
		if  ( $userInput =~ /$word/i ) {
			$matched++;
			$filteredWord = $word;	
		}
	}
	my @done = ($matched, $filteredWord);
return(@done);
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

	my $verified = 0;
	while(!$verified) {
		my @values = verifyInput($choice1);
		if ($values[0] eq 1) {
			$choice1 = $values[1];
			$verified = $values[0];
		}
	}
	
	if ($choice1 =~ 'park') { 
		print "Oh this is wonderful! We're here for parkers, what vehicle do you have; Car, Van, or Bike?\n";
		$choice2 = <>;
		chomp($choice2);
		my $verified = 0;
	        while(!$verified) {
	                my @values = verifyInput($choice2);
	                if ($values[0] eq 1) {
	                        $choice2 = $values[1];
	                        $verified = $values[0];
	                }
	        }
		park($choice2);
		};

	if ($choice1 =~ 'leave') {
		print "Now you're a driver and not a parker. Ugh, what kind of vehicle do you have, Car Van or Bike?\n";
		$choice2 = <>;
		chomp($choice2);
		my $verified = 0;
                while(!$verified) {
                        my @values = verifyInput($choice2);
                        if ($values[0] eq 1) { 
                                $choice2 = $values[1];
                                $verified = $values[0];
                        }       
                }   
		leave($choice2);
		};
};

