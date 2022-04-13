#! /usr/bin/env bash

set -Eeuo pipefail

curl -s "$1" |
	pup div.b |
	pandoc -f html -t html -s \
		-M document-css=false \
		-M title='A poem from Ganjoor' \
		-M lang=ar -M dir=rtl \
		-H head.html \
		-A script.html \
		-o ghazal-output.html
