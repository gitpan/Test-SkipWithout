use strict;
use warnings;

use Test::More tests => 1;

# Make sure this is defined AFTER Test::More's end block
END {
    pass("Should See This"); # Failing Result
};

use Test::SkipWithout 'Test::SkipWithout' => '0.001';
