use strict;
use warnings;
use Test::Simple tests => 1;

use parking;

my $test1 = testSub(1);

ok( $test1 eq 1 , 'Testing the Test1 Sub');
