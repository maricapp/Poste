#!/usr/bin/perl

use 5.010;
use lib 'lib';

use Model::DB;

say Model::DB->pragma('foreign_keys');
