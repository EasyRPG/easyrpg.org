#!/bin/bash

set -e

if [ "x$1" == "xredirect" ]; then
  # remove content
  rm -rf content

  # make redirect page default
  mkdir content
  cp .netlify/redirect.md content/index.md

  # relocate assets
  sed -r 's#(href|src)="/#\1="https://easyrpg.org/#g' -i layouts/default.slim
fi

# correct url
sed "s#DEPLOY_PRIME_URL#${DEPLOY_PRIME_URL}#" -i nanoc.yaml

# build site
nanoc --env=netlify
