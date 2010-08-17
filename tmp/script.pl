#!/usr/bin/perl

use 5.010;

use strict;
use warnings;
use ORLite {
    'package'   => 'Foo',
    'file'      => 'foo.db',
};

say 'Schema Version: ', Foo->pragma('schema_version');
say 'DB Version:     ', Foo->pragma('user_version');

say '-' x 40;

my $client = Foo::Clients->load(1);

say $client->{'name'}, ' -> ', $client->{'age'};

say '-' x 40;

Foo::Clients->iterate(
    'order by age',
    sub {
        say $_->name, ' -> ', $_->age;
    }
);
