use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";
use WebServiceOneDay;
use File::Spec;

sub {
    my $path = File::Spec->catfile('text.mkdn');
    my $html = WebServiceOneDay::markdown2html($path);
    return [200, [ 'Contet-Type' => 'text/html', 'Content-Length' => length $html ], [$html]];
};
