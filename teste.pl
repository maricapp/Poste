#!/usr/bin/perl

use 5.010;
use lib 'lib';
use Data::Dumper;

use Model::DB;

say Dumper(Model::DB->get_last_published_posts);
