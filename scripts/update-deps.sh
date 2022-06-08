#!/usr/bin/env bash

# Virtual env activated

# bash strict mode
# https://explainshell.com/explain?cmd=set+-euxo+pipefail
set -euxo pipefail

# Delete requirements
rm -rf requirements*.txt

# Update requirements
pip-compile requirements.in -o requirements.txt