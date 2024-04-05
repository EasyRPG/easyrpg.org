#!/bin/bash

set -e

if [ "x$1" == "xredirect" ]; then
  # remove pages content
  find content/ -type f -a \( -name '*.md' -o -name '*.html' \) --delete

  # make redirect page default
  cp .netlify/redirect.md content/index.md
fi

# correct url
sed "s#DEPLOY_PRIME_URL#${DEPLOY_PRIME_URL}#" -i nanoc.yaml

# build site
nanoc --env=netlify
