#!perl 

use strict;
use warnings;
use diagnostics;

use Test::More tests => 1;

use Model::DB;

use Data::Dumper;

#Teste Metodo get_post_list

my $list_ref = Model::DB->get_post_list_ref('poste');

#die Dumper($list_ref);
ok($list_ref->[0]->{post_id} eq 1,'Teste de get_post_list');
