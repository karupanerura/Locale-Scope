# NAME

Locale::Scope - scope based [setlocale(3)](http://man.he.net/man3/setlocale)

# SYNOPSIS

    use POSIX qw/LC_TIME/;
    use Locale::Scope qw/locale_scope/;

    # hear LC_TIME locale is C!!
    {
        my $scope = locale_scope(LC_TIME, "ja_JP.UTF-8");
        # hear LC_TIME locale is ja_JP.UTF-8!!
        {
            my $scope = locale_scope(LC_TIME, "es_AR.ISO8859-1");
            # hear LC_TIME locale is es_AR.ISO8859-1!!
        }
        # hear LC_TIME locale is ja_JP.UTF-8!!
    }
    # hear LC_TIME locale is C!!

# DESCRIPTION

__THE SOFTWARE IS IT'S IN ALPHA QUALITY. IT MAY CHANGE THE API WITHOUT NOTICE.__

Locale::Scope is scope based [setlocale(3)](http://man.he.net/man3/setlocale) for rollback locale at the end of a scope.

# FUNCTION

- $scope = locale\_scope($category, $locale);

    Set the program's current locale.
    It creates a new Locale::Scope object which rollbacks locale when its DESTROY method is called.

        my $scope = locale_scope($category, $locale);

        # or

        my $scope = Locale::Scope->new($category, $locale);

# LICENSE

Copyright (C) karupanerura.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

karupanerura <karupa@cpan.org>
