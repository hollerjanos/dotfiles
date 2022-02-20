#! /usr/bin/env bash

#==============================
# Polybar - Launch script
#==============================

# Creator: Holler János
# First release: 2022-02-20 02:56:33
# Latest update: 2022-02-20 02:56:41
# Editor: NVIM v0.5.0

#==============================
# Process
#==============================

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar.log
polybar top 2>&1 | tee -a /tmp/polybar.log & disown

echo "Bars launched..."
