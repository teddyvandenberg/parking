use strict;
use warnings;
use Data::Dumper;
use lib ".";

#configuration
my $vanSpaces = 5;
my $carSpaces = 1;
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
	'Van' => {
		'totalSpaces' => $vanSpaces,
		'usedSpaces' => 0,
	},
	'Car' => {
                'totalSpaces' => $carSpaces,
                'usedSpaces' => 0,
        }, 
	'Bike' => {
                'totalSpaces' => $bikeSpaces,
                'usedSpaces' => 0,
        }, 
);

sub isFull {
	our ($type) = @_;
	if ($spaces{$type}{'totalSpaces'} > $spaces{$type}{'usedSpaces'})
		{return(0);}
	else {return(1);}
}

sub park {
	our ($type) = @_;
        if (!isFull($type)) {$spaces{$type}{'usedSpaces'}++;}
        else { print "Our sincere apologies, there are not enough available spaces for you at this time. Please come back later";}
}

sub leave {
	our ($type) = @_;
	$spaces{$type}{'usedSpaces'}--;
#	print Dumper(\%spaces);
}

sub displayStats {
#MATH
	our $vanNum = $spaces{'Van'}{'totalSpaces'} - $spaces{'Van'}{'usedSpaces'};
	our $carNum = $spaces{'Car'}{'totalSpaces'} - $spaces{'Car'}{'usedSpaces'};
	our $bikeNum = $spaces{'Bike'}{'totalSpaces'} - $spaces{'Bike'}{'usedSpaces'};

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
	while (!$matched) { # using a conditional here is hacky, TODO this needs to be refactored into an eval
		foreach my $word (@allowedWords) {
			if  ( $userInput =~ /$word/i ) { # TODO improve regex to match start and end of allowed words to limit bad matches
				$filteredWord = $word;
				$matched++;	
			}
		}
		if (!$matched) {
			print "I'm sorry, I did not recognize that word. Could you try again?\n";
			$userInput = <>;
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

