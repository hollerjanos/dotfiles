#! /usr/bin/env bash

# Variable(s)
scriptPath=$(realpath $(dirname ${0}))
commandPath=$(which xwallpaper)
option=--stretch
wallpaperName=wallpaper.png

# Process
${commandPath} ${option} ${scriptPath}/${wallpaperName}
