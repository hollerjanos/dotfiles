#! /usr/bin/env bash

#==============================
# Introduction(s)
#==============================

# Creator: Holler János
# First release: 2022-01-16 03:12:14
# Latest update: 2022-01-16 03:12:24
# Editor: NVIM

#==============================
# Process
#==============================

# Declare: All the possible options
declare -a options=(
  "Suspend"
  "Reboot"
  "Power OFF"
)

# Display & also store the choice of the user
choice=$(printf "%s\n" "${options[@]}" | dmenu -i -l 20 -p "?")

# Possible results:
case "${choice}" in
  "Suspend")
    systemctl suspend
    ;;
  "Reboot")
    systemctl reboot
    ;;
  "Power OFF")
    systemctl poweroff
    ;;
  *)
    echo "Program Terminated."
    exit 1
esac
