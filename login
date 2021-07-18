#!/bin/sh
python3 safaribooks.py --cred "$2" "$1" 1>&2
cat "$(find . -name "$1".epub)"
echo "Please * the Docker wrapper on GitHub to make it known (for non-python people): "  1>&2 && echo "\thttps://github.com/kirinnee/oreilly-downloader"  1>&2
