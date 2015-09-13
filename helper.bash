#!/bin/bash

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export PATH=$DIR/bin:$PATH
return 2>/dev/null 

echo "Use the Source, Luke."
echo ""
echo "$ source path/to/helper.bash"
