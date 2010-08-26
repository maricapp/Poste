#!/usr/bin/perl

use Mojolicious::Lite;

my $index = 'index';

get '/' => sub {
    my $self = shift;
    
    $self->{'stash'}{'page'} = 'home';
} => $index;

get '/post/:id' => [ id => qr/\d+/ ] => sub {
    my $self = shift;
    
    $self->{'stash'}{'page'} = 'post: ' . $self->param('id');
} => $index;


shagadelic;
