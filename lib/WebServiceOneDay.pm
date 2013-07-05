package WebServiceOneDay;
use strict;
use warnings;
use Text::Markdown qw/markdown/;
use Path::Class qw/file/;
use Encode qw/decode_utf8/;
use Data::Section::Simple qw/get_data_section/;
use Text::MicroTemplate qw/render_mt/;

sub markdown2html {
    my $file = shift;
    my $path = file($file) or die "Cannot find $file";
    my $content = $path->slurp;
    my ($title) = $content =~ m!^#\s+([^#]+?)\n!;
    my $html = render_mt(get_data_section('head.html'), $title)->as_string;
    $html .= markdown($content);
    $html .= get_data_section('foot.html');
    return $html;
}

1;

__DATA__

@@ head.html
<html>
<head>
  <title><?= $_[0] ?></title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div id="content">

@@ foot.html
</div>
</body>
</html>
