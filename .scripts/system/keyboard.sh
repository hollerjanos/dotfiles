#! /usr/bin/env bash

#==============================
# Introduction(s)
#==============================

# Creator: Holler János
# First release: 2022-01-20 09:15:44
# Latest update: 2022-01-20 09:15:k8
# Editor: NVIM

#==============================
# Process
#==============================

# Declare: All the possible options
declare -a options=(
  "English (UK)"
  "Hungary (HU)"
)

# Display & also store the choice of the user
choice=$(printf "%s\n" "${options[@]}" | dmenu -i -l 20 -p "?")

# Possible results:
case "${choice}" in
  "English (UK)")
    setxkbmap gb
    notify-send -u low -t 2500 "Keyboard layout" "Changed to English (UK)"
    ;;
  "Hungary (HU)")
    setxkbmap hu
    notify-send -u low -t 2500 "Keyboard layout" "Changed to Hungary (HU)"
    ;;
  *)
    echo "Program Terminated."
    exit 1
esac
