#!perl 

use strict;
use warnings;
use diagnostics;

use Test::More tests => 1;

use Model::DB;

use Data::Dumper;

#Teste de Insert Post

my $post = Model::DB::Posts->create(

        post_id       => '2',
        author        => 'renato',          
        publish_date  => '1289596953',     
        title         => 'oi',
        content       => 'oi tudo bem',
        status        => '1',
);
ok(defined $post, 'Teste de insercao post');

