#!/bin/bash

set -e

# ignore dependabot branches, others are easily added
case "$BRANCH" in
  dependabot/*) exit 0;;
esac

# build
exit 1
