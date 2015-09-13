# easy-rpg.org

Source code of the EasyRPG homepage https://easy-rpg.org

## Make initial gem bundle:

    bundle install --binstubs --path=vendor/bundle [--shebang="ruby1.9"]

## Build page:

    nanoc

## Start local server (needs adsf):

    nanoc view

Visit the site at http://localhost:3000/ locally. Use `CTRL` + `C` to stop the
server.

## Setup automatic rebuild (already done if `Guardfile` exists):

    guard init nanoc

## Start automatic rebuild

    guard

Use `exit` to end the guard shell.
