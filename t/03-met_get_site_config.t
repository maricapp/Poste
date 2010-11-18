#!perl 

use strict;
use warnings;
use diagnostics;

use Test::More tests => 1;

use Model::DB;

use Data::Dumper;

#Teste Metodo get_site_config

my $value = Model::DB->get_site_config('theme', 'bamboo');

ok($value eq 'bamboo', 'Teste get_site_config');
