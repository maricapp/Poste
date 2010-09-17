use inc::Module::Install;

name     'Poste';
all_from 'lib/Poste.pm';
author   q{Blabos de Blebe <blabos@cpan.org>};
license  'perl';

build_requires 'Test::More';

requires 'ORLite';

auto_install;

WriteAll;

