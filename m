#!/bin/sh
#
# [m]usic

[ "$1" ] || exit 1

youtube-dl \
	--extract-audio \
	--audio-format mp3 \
	--prefer-ffmpeg \
	--add-metadata \
	--audio-quality 0 \
	--embed-thumbnail \
	--output '%(title)s.%(ext)s' \
	"$1"
