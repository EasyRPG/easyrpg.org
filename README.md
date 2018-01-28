# easyrpg.org

Source code of the EasyRPG homepage at https://easyrpg.org

## Command reference

Install needed gems:

```bash
$ bundle install --binstubs --path=vendor/bundle [--shebang="ruby2.1"]
```

This will install all needed gems in the `vendor/bundle` folder and provide
available commands in the `bin` directory. You can use `helper.bash` script
to add them to your `$PATH` and therefore make them available to your shell:

```bash
$ source helper.bash
```

Alternatively, you may run commands with prefix, i.e. `bin/nanoc`.

To build the page:

```bash
$ nanoc
```

For convenience there are several rake task provided:

```bash
$ rake -T
rake all      # Clear, compile and check website
rake check    # Check compiled website for problems
rake clean    # Remove any temporary products
rake clobber  # Remove any generated files
rake compile  # Compile website
rake default  # Compile website and view locally
rake rebuild  # Automatically rebuild website on changes
rake view     # Make website available at http://localhost:3000
```
