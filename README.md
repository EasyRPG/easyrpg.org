# easyrpg.org

Source code of the EasyRPG homepage at https://easyrpg.org


## Requirements

 - [ruby] >2.4
 - [nanoc] >4.12
 - [tidy-html5]
 - [some gems]


## Source code

Homepage development is hosted by GitHub, project files are available in this
git repository:

https://github.com/EasyRPG/easyrpg.org


## Building the site

Install needed gems (choose one):

```bash
$ make install       # for building the site
$ make install-devel # for additional development and testing
```

This will install all needed gems in the `vendor/bundle` folder and provide
available commands in the `bin` directory. You can use `helper.bash` script
to add them to your `$PATH` and therefore make them available to your shell.
Alternatively, you may run commands with prefix, i.e. `bin/nanoc`.

```bash
$ source helper.bash
$ nanoc      # to build the page
$ guard      # Automatically rebuild website on changes
$ nanoc view # Make website available at http://localhost:3000
$ nanoc live # Combination of last two commands
```

For convenience there is a `Makefile` provided:

```bash
$ make           # Compile website and view it
$ make compile   # Compile website
$ make all       # Clear, compile and check website
$ make check     # Check compiled website for problems
$ make clean     # Remove generated page
$ make distclean # Remove any generated files and bundled gems
$ make install   # Install gems and configure environment
```


## Bug reporting

Available options:

* File an issue at https://github.com/EasyRPG/easyrpg.org/issues
* Open a thread at https://community.easyrpg.org
* Chat with us via IRC: [#easyrpg at Libera Chat]
* Contact us at https://easyrpg.org/contact/


## License

The homepage is currently provided "as-is", we are currently not able to have
a common license for all files, as they have been cluttered over the years. We
are going to clear that up and hope to provide it under a Creative Commons
license later. We hope that this is in the intention of the original authors
and designers (see [issue #5] for reference).


### 3rd party software

Included are the following 3rd party software:

* jQuery - https://jquery.com - Copyright (c) JS Foundation and other contributors,
  provided under the MIT license

* Magnific Popup - http://dimsemenov.com/plugins/magnific-popup/ -
  Copyright (c) 2014-2016 Dmitry Semenov, provided under the MIT license

* Favicons have been processed by https://realfavicongenerator.net

* IRC contact page is provided by https://kiwiirc.com


[#easyrpg at Libera Chat]: https://kiwiirc.com/nextclient/#ircs://irc.libera.chat/#easyrpg?nick=rpgguest??
[ruby]: https://www.ruby-lang.org
[nanoc]: https://nanoc.ws/
[tidy-html5]: http://www.html-tidy.org
[some gems]: Gemfile
[issue #5]: https://github.com/EasyRPG/easyrpg.org/issues/5
