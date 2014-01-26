#!/usr/bin/env perl

use strict;
use warnings;

use File::Spec;
use File::Basename qw//;
use File::Path qw//;

sub filter_ignore {
    grep { !/(^|\/)(\.{1,2}|\.git|\.gitmodules|.*\.sw[po]|\.Apple.*)$/ } @_
}

my $HOME = $ENV{'HOME'} || die "Environment variable HOME isn't set";

my %TARGET_DIR_TO_FILES = (
    $HOME          => [ grep { !/^\.byobu|\.config$/ } filter_ignore glob(".*") ],
    "$HOME/.byobu" => [ filter_ignore glob(".byobu/{.*,*}") ],
);

for my $dir (keys %TARGET_DIR_TO_FILES) {
    File::Path::make_path($dir);
    for my $orig_file (@{$TARGET_DIR_TO_FILES{$dir}}) {
        my $fn = File::Basename::fileparse($orig_file);
        my $f = File::Spec->catfile($dir, $fn);
        my $t = File::Spec->abs2rel(File::Spec->rel2abs($orig_file), $dir);
        print "Creating '$f'";
        if (-l $f) {
            print " [link exists]\n";
            next;
        }
        if (-e $f && !-w $f) {
            print ": file is not writable\n";
            next;
        }
        if (-e $f) {
            print ": file already exists, overwrite? [y/N] ";
            my $prompt = <STDIN>;
            next unless $prompt =~ m/^y/i;
            print "Overwriting '$f'";
            unlink $f;
        }
        symlink($t, $f) || print ": cannot create";
        print " \n";
    }
}

