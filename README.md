# NAME

Locale::Scope - It's new $module

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

Locale::Scope is ...

# LICENSE

Copyright (C) karupanerura.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

karupanerura <karupa@cpan.org>
