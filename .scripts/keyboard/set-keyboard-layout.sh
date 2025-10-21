#!/usr/bin/env bash

#==============================
# Set keyboard layout
#==============================

# Creator:
# - Name:     Holler János
# - Date:     2021-09-08 21:43:15
# - Software: NVIM v0.5.0

# Introduction(s):
# - Easy way to change the layout of the
#   keyboard.

#==============================
# Function(s)
#==============================

# Draw table
drawTable() {
  echo "╔═══╦══════════════════════════════════════════════╗"
  echo "║   ║ Keyboard layout                              ║"
  echo "╠═══╬══════════════════════════════════════════════╣"
  echo "║ 0 ║ Close the menu                               ║"
  echo "║   ║                                              ║"
  echo "║ 1 ║ English (UK)                                 ║"
  echo "║ 2 ║ English (US)                                 ║"
  echo "║ 3 ║ Hungary (HU)                                 ║"
  echo "╚═══╩══════════════════════════════════════════════╝"
}

# Process
process() {
  clear -x
  drawTable
  read keyboardLayout
  if [[ ${keyboardLayout} =~ ^[+-]?[0-9]+$ ]]; then
    clear -x
    case ${keyboardLayout} in
      0)
        exit
        ;;
      1)
        setxkbmap gb
        notify-send -u low -t 2500 "Keyboard layout" "Changed to English (UK)"
        ;;
      2)
        setxkbmap us
        notify-send -u low -t 2500 "Keyboard layout" "Changed to English (US)"
        ;;
      3)
        setxkbmap hu
        notify-send -u low -t 2500 "Keyboard layout" "Changed to Hungary (HU)"
        ;;
    esac
  else
    clear -x
    process
  fi
  process
}

#==============================
# Process
#==============================

process
