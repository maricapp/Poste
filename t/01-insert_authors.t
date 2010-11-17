#!perl 

use strict;
use warnings;
use diagnostics;

use Test::More tests => 1;

use Model::DB;

use Data::Dumper;

#Teste de Insert authors

my $author = Model::DB::Authors->create(

        username    => 'renato',
        password    => '1234',
        email       => 'renato@hotmail.com',
        full_name   => 'renato tamaki'

);
ok(defined $author, 'Teste de insercao authors');

