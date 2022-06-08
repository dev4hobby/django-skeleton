#!/usr/bin/env bash

exist=$(pip list | grep pip-tools)
if [ -z "$exist" ]; then
    echo "pip-tools not installed, installing..."
    pip install pip-tools
fi