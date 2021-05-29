#!/usr/bin/env bash

set -Eeuo pipefail

curl --compressed --silent "$1" |
	pup --charset UTF-8 div.b |
	pandoc -f html -t html -s \
		-M document-css=false \
		-M title="A poem from Ganjoor" \
		-M lang=ar -M dir=rtl \
		-H ./head.html \
		-A ./script.html \
		-o ghazal-output.html
