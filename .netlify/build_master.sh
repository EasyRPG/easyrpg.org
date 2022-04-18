#!/bin/bash

set -e

# remove content
rm -rf content/

# make redirect page default
mkdir -p content
cp .netlify/redirect.md content/index.md

# relocate assets
sed -r 's#(href|src)="/#\1="https://easyrpg.org/#g' -i layouts/default.slim

# build site
nanoc
