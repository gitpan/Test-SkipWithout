#!/usr/bin/perl
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
    NAME => 'Test::SkipWithout',

    VERSION_FROM  => "lib/Test/SkipWithout.pm",
    ABSTRACT_FROM => "lib/Test/SkipWithout.pm",
    AUTHOR        => 'Chad Granum <exodist7@gmail.com>',

    LICENSE => 'perl',

    PREREQ_PM => {
        'Test::More' => 0,
    },

    META_MERGE => {
        resources => {
            license    => 'http://dev.perl.org/licenses/',
            homepage   => 'http://github.com/exodist/Test-SkipWithout/',
            bugtracker => 'http://github.com/exodist/Test-SkipWithout/issues/',
            repository => 'http://github.com/exodist/Test-SkipWithout/',
        },
    },
);
