#!/usr/bin/perl

use Mojolicious::Lite;

plugin 'tt_renderer' => {
    'template_options' => {
        'WRAPPER' => 'index'
    }
};

get '/' => sub {
    my $self = shift;
    
    $self->stash('message' => 'Hello World!!!');
} => 'home';

get '/foo' => 'foo';

shagadelic;
