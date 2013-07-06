#!/usr/bin/env perl
use strict;
use warnings;
use Net::Twitter::Lite::WithAPIv1_1;
use Config::Pit;
use Encode;
use utf8;

binmode STDOUT, ':utf8';

my $config = pit_get('twitter-api');
my $nt = Net::Twitter::Lite::WithAPIv1_1->new(
    consumer_key => $config->{consumer_key},
    consumer_secret => $config->{consumer_secret},
    access_token => $config->{token},
    access_token_secret => $config->{token_secret}
);
my $result = $nt->search(
    {
        q                => 'おはよう',
        include_entities => 1,
        result_type      => 'recent',
        count            => 100
    }
);

for my $tweet (@{$result->{statuses}}) {
    print "$tweet->{text}\n";
    print "----------------------------------------\n";
}

