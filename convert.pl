#!/usr/bin/env perl
use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";
use WebServiceOneDay;
use File::Spec;
use Path::Class qw/file/;

my $path = $ARGV[0] or die "File path is required!";
my $html = WebServiceOneDay::markdown2html(File::Spec->catfile($path));
my $output = file('index.html');
my $fh = $output->open('w');
print $fh $html;
