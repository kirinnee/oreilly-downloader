#!/bin/sh
python3 safaribooks.py --cred "$2" "$1" 1>&2
cat "$(find . -name "$1".epub)"