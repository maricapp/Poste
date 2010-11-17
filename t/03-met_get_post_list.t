#!perl 

use strict;
use warnings;
use diagnostics;

use Test::More tests => 1;

use Model::DB;

use Data::Dumper;

#Teste Metodo get_post_list

my @list = Model::DB->get_post_list('poste');

ok($list[1]->{post_id} eq 1,'Teste de get_post_list');
