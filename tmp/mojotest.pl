#!/usr/bin/perl

use Mojolicious::Lite;

plugin 'tt_renderer' => {
    'template_options' => {
        'WRAPPER' => 'index'
    }
};

get '/' => 'home';

get '/foo' => 'foo';


shagadelic;
