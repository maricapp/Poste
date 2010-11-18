#!perl 

use strict;
use warnings;
use diagnostics;

use Test::More tests => 1;

use Model::DB;

use Data::Dumper;

#Teste Metodo get_author

my $name = Model::DB->get_author('poste');
ok($name->{username} eq 'poste', 'Teste get author');
