use strict;
use Test::More;

use POSIX qw/setlocale LC_ALL/;
use Locale::Scope qw/locale_scope/;

setlocale(LC_ALL, "C")           or plan skip_all => 'locale "C"           is not defined in this system.';
setlocale(LC_ALL, "ja_JP.UTF-8") or plan skip_all => 'locale "ja_JP.UTF-8" is not defined in this system.';
setlocale(LC_ALL, "en_US.UTF-8") or plan skip_all => 'locale "en_US.UTF-8" is not defined in this system.';

plan tests => 9;
my $locale = setlocale(LC_ALL, "C");
is setlocale(LC_ALL), $locale, 'C';
{
    my $scope = locale_scope(LC_ALL, 'ja_JP.UTF-8');
    is setlocale(LC_ALL), 'ja_JP.UTF-8', 'ja_JP.UTF-8';
    {
        my $scope = locale_scope(LC_ALL, "en_US.UTF-8");
        is setlocale(LC_ALL), 'en_US.UTF-8', 'en_US.UTF-8';
    }
    is setlocale(LC_ALL), 'ja_JP.UTF-8', 'ja_JP.UTF-8';
    {
        my $scope = locale_scope(LC_ALL, "en_US.UTF-8");
        is setlocale(LC_ALL), 'en_US.UTF-8', 'en_US.UTF-8';
        {
            my $scope = locale_scope(LC_ALL, 'ja_JP.UTF-8');
            is setlocale(LC_ALL), 'ja_JP.UTF-8', 'ja_JP.UTF-8';
        }
        is setlocale(LC_ALL), 'en_US.UTF-8', 'en_US.UTF-8';
    }
    is setlocale(LC_ALL), 'ja_JP.UTF-8', 'ja_JP.UTF-8';
}
is setlocale(LC_ALL), $locale, 'C';
