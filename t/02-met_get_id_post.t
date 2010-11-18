#!perl 

use strict;
use warnings;
use diagnostics;

use Test::More tests => 1;

use Model::DB;

use Data::Dumper;

#Teste Metodo get_id_post

my $id = 1;
my $posts = Model::DB->get_post_by_id($id);

ok($posts->{post_id} == 1, 'Teste get_post_list');
