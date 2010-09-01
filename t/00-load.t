#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Poste' ) || print "Bail out!
";
}

diag( "Testing Poste $Poste::VERSION, Perl $], $^X" );
