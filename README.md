# easyrpg.org

Source code of the EasyRPG homepage at https://easyrpg.org


## Requirements

 - [ruby]
 - [nanoc]
 - [sass gem]
 - [rake gem] (optional)


## Source code

Homepage development is hosted by GitHub, project files are available in this
git repository:

https://github.com/EasyRPG/easyrpg.org


## Building the site

Install needed gems:

```bash
$ bundle install --path=vendor/bundle
$ bundle binstubs nanoc guard [rake]
```

This will install all needed gems in the `vendor/bundle` folder and provide
available commands in the `bin` directory. You can use `helper.bash` script
to add them to your `$PATH` and therefore make them available to your shell.
Alternatively, you may run commands with prefix, i.e. `bin/nanoc`.

```bash
$ source helper.bash
$ nanoc # to build the page
```

For convenience there are several rake tasks provided:

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


## Bug reporting

Available options:

* File an issue at https://github.com/EasyRPG/easyrpg.org/issues
* Open a thread at https://community.easyrpg.org/
* Chat with us via IRC: [#easyrpg at irc.freenode.net]


## License

The homepage is currently provided "as-is", we are currently not able to have
a common license for all files, as they have been cluttered over the years. We
are going to clear that up and hope to provide it under a Creative Common
licence later. We hope that this is in the intention of the original authors
and designers. (See issue #5 for reference)


### 3rd party software

Included are the following 3rd party software:

* jQuery - https://jquery.com/ - Copyright (c) JS Foundation and other contributors,
  provided under the MIT license

* Magnific Popup - http://dimsemenov.com/plugins/magnific-popup/ -
  Copyright (c) 2014-2016 Dmitry Semenov, provided under the MIT license

* Favicons have been processed by https://realfavicongenerator.net

* IRC contact page is provided by https://kiwiirc.com


[#easyrpg at irc.freenode.net]: https://kiwiirc.com/nextclient/#ircs://irc.freenode.net/#easyrpg?nick=rpgguest??
[ruby]: https://www.ruby-lang.org
[nanoc]: https://nanoc.ws/
[sass gem]: https://github.com/sass/ruby-sass
[rake gem]: https://ruby.github.io/rake/
