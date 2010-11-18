#!perl 

use strict;
use warnings;
use diagnostics;

use Test::More tests => 2;

use Model::DB;

use Data::Dumper;

#Teste Metodo get_last_published_posts

my $post = Model::DB::Posts->create(
    post_id       => '2',
    author        => 'poste',          
    publish_date  => '1289596953',     
    title         => 'oi',
    content       => 'oi tudo bem',
    status        => '3',
);
my $list_ref = Model::DB->get_last_published_posts;

my $first   = $list_ref->[0]->{post_id} eq '2';
my $second  = $list_ref->[1]->{post_id} eq '1';

ok($first,'testando primeiro ultimo publicado');
ok($second,'testando primeiro penultimo publicado');

Model::DB::Posts->delete('where post_id = 2');

