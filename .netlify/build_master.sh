#!/bin/bash

set -e

# remove content
rm -rf content/

# temp dir
mkdir -p content

# make redirect page default
cp .netlify/redirect_index.md content/index.md

# relocate assets
sed 's|href="/|href="https://easyrpg.org/|g' -i layouts/default.slim

# build site
nanoc
