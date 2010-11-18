#!perl 

use strict;
use warnings;
use diagnostics;

use Test::More tests => 1;

use Model::DB;

use Data::Dumper;

#Teste de Remoção authors

my $author = Model::DB::Authors->load('renato');
$author->delete;
my $parcial = Model::DB::Authors->count( 'where username = ?', 'renato' );

ok($parcial == 0, 'Teste remocao authors');

