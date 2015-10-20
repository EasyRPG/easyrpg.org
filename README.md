# easy-rpg.org

Source code of the EasyRPG homepage at https://easy-rpg.org

## Command reference

Install needed gems:

    $ bundle install --binstubs --path=vendor/bundle [--shebang="ruby1.9"]

This will install all needed gems in the `vendor/bundle` folder and provide
available commands in the `bin` directory. You can use `helper.bash` script
to add them to your `$PATH` and therefore make them available to your shell.

Build page:

    $ nanoc

For convenience there are several rake task provided:

```bash
$ rake -T
rake all      # Clear, compile and check website
rake check    # Check compiled website for problems
rake clean    # Remove any temporary products
rake clobber  # Remove any generated file
rake compile  # Compile website
rake default  # Compile website and view locally
rake deploy   # Deploy website to staging webserver
rake rebuild  # Automatically rebuild website on changes
rake view     # Make website available at http://localhost:3000
```

Using rake the needed commands will automagically run in bundler environment.
