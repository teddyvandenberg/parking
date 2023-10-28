use strict;
use warnings;
use Test::Simple tests => 11;

use parking;

my @carUpper = verifyInput('Car');

ok($carUpper[0] eq 1 , 'Car uppercase matches');

my @carLower = verifyInput('car');

ok($carLower[0] eq 1 , 'Car lowercase matches');

my @vanUpper = verifyInput('Van');

ok($vanUpper[0] eq 1 , 'Van uppercase matches');

my @vanLower = verifyInput('van');

ok($vanLower[0] eq 1 , 'van lowercase matches');

my @bikeUpper = verifyInput('Bike');

ok($bikeUpper[0] eq 1 , 'Bike uppercase matches');

my @bikeLower = verifyInput('bike');

ok($bikeLower[0] eq 1 , 'bike lowercase matches');

my @parkUpper = verifyInput('Park');

ok($parkUpper[0] eq 1 , 'Park uppercase matches');

my @parkLower = verifyInput('park');

ok($parkLower[0] eq 1 , 'park lowercase matches');

my @leaveUpper = verifyInput('Leave');

ok($leaveUpper[0] eq 1 , 'Leave uppercase matches');

my @leaveLower = verifyInput('leave');

ok($leaveLower[0] eq 1 , 'leave lowercase matches');

my @unknownWord = verifyInput('pecan');

ok($unknownWord[0] eq 0 , 'Rejects unknown words');
