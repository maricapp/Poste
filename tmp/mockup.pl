#!/usr/bin/perl

use Mojolicious::Lite;


# Mostra todos os X últimos posts
get '/' => sub {
    my $self = shift;
    
    $self->stash->{'page'} = 'raiz';
} => 'index';


# Mostra o post com o id X
get '/:id' => ['id' => qr/\d+/ ] => sub {
    my $self = shift;
    
    $self->stash->{'page'} = 'somente o post: ' . $self->param('id');
} => 'index';

# Mostra todos os últimos X posts do autor Y
get '/:author' => ['author' => qr/\w+/ ] => sub {
    my $self = shift;
    
    $self->stash->{'page'} = 'Posts do autor: ' . $self->param('author');
} => 'index';


# Direciona o usuário para a tela de login
get '/login' => sub {
    my $self = shift;
    
    $self->stash->{'page'} = 'form login';
} => 'index';


# Trata o login do usuário
post '/login' => sub {
    my $self = shift;
    
    $self->stash->{'page'} = 'tratar login: ' . $self->param('username');
} => 'index';


# Executa logout
get '/logout' => sub {
    my $self = shift;
    
    $self->stash->{'page'} = 'Executar logout';
} => 'index';


# Página inicial de administração do blog
get '/admin' => sub {
    my $self = shift;
    
    $self->stash->{'page'} = 'administracao';
} => 'index';


# Admin lista de post
get '/admin/list' => sub {
    my $self = shift;
    
    $self->stash->{'page'} = 'admin lista de post';
} => 'index';


# Admin Edição de post
get '/admin/edit/:id' => {'id' => 0} => ['id' => qr/\d+/ ] => sub {
    my $self = shift;
    
    $self->stash->{'page'} = 'admin edicao de post id: ' . $self->param('id');
} => 'index';


# Admin Salvar (novo/editar) post
post '/admin/save/:id' => ['id' => qr/\d+/ ] => sub {
    my $self = shift;
    
    $self->stash->{'page'} = 'tratar edicao do post: ' . $self->param('id');
} => 'index';


# Admin deletar post
get '/admin/del/:id' => ['id' => qr/\d+/ ] => sub {
    my $self = shift;
    
    $self->stash->{'page'} = 'Excluir post: ' . $self->param('id');
} => 'index';


shagadelic;

