#!perl 

use strict;
use warnings;
use diagnostics;

use Test::More tests => 1;

use Model::DB;

use Data::Dumper;

#Teste de Remoção Post

my $id = 2;
my $posts = Model::DB::Posts->load($id);
$posts->delete;
my $parcial = Model::DB::Posts->count( 'where post_id = ?', '2' );

ok($parcial == 0, 'Teste remocao Post');
