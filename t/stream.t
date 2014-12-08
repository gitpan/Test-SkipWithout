use strict;
use warnings;

use Test::More;
use Test::SkipWithout 'Test::More' => '1.301001';

use Test::Stream::Tester;

events_are(
    intercept {
        Test::SkipWithout->import('fake::module::dfasdhfafahgsdahfgashdfashgfgdgasdgfs');
        fail("Should not see this!");
    },
    check {
        event plan => {
            directive => 'SKIP',
            reason => 'fake::module::dfasdhfafahgsdahfgashdfashgfgdgasdgfs is not installed, skipping test.',
        };
        directive 'end';
    },

    "Skip from missing module"
);

events_are(
    intercept {
        Test::SkipWithout->import('Test::SkipWithout' => '9000.001');
        fail("Should not see this!");
    },
    check {
        event plan => {
            directive => 'SKIP',
            reason => qr/^Test::SkipWithout version 9000\.001 required--this is only version/,
        };
        directive 'end';
    },

    "Skip from insufficient version"
);

events_are(
    intercept {
        Test::SkipWithout->import('Test::SkipWithout' => '0.001');
        pass("Should see this!");
    },
    check {
        event ok => { bool => 1, name => 'Should see this!' };
        directive 'end';
    },

    "No Skip"
);

done_testing;
