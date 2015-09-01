package DDG::Spice::RiffsyEmojiSearch;
# ABSTRACT: Search Riffsy (http://www.riffsy.com) for animated GIFs related to an emoji.
use DDG::Spice;
use utf8;

spice is_cached => 1;

name "RiffsyEmojiSearch";
source "Riffsy";
description "Search Riffsy for animated GIFs";
primary_example_queries "👍";
category "entertainment";
topics "everyday", "entertainment", "food_and_drink", "gaming", "geek", "music", "science", "social", "special_interest";
code_url "https://github.com/bryanhart/zeroclickinfo-spice/blob/master/lib/DDG/Spice/RiffsyEmojiSearch.pm";
attribution web => ["http://www.riffsy.com","Riffsy"],
            twitter => "riffsyapp";

spice to => 'http://api1.riffsy.com/v1/search?tag=$1&key={{ENV{DDG_SPICE_RIFFSY_APIKEY}}}&safesearch=strict&searchtype=emoji';
spice wrap_jsonp_callback => 1;

triggers query_lc => qr/^\X$/;

handle query_lc => sub {
    return unless $_;
    return $_;
};

1;
