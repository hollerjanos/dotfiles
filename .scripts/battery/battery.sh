#!/usr/bin/env bash

#==============================
# Battery
#==============================

# Creator:
# - Name:     Holler János
# - Date:     2021-09-12 00:45:58
# - Software: NVIM v0.5.0

# Introduction(s):
# - The following script will notify the user about the battery percentage.
# - The notification will pop up only if the battery is:
#   - 100% & Charing (Full)
#   - =>85% & Charing (Almost full)
#   - =<15% & Not charing (Low)
#   - =<5% & not charing (Very low)
# - If the battery is in the "Very low" section, the notification will be
#   displayed in a different box, to make it more noticable to the user.

#==============================
# Function(s)
#==============================

# ${1} => Urgency level
# - low
# - normal
# - critical
# ${2} => Expire time (ms)
# 4{3} => Message

notify () {
  notify-send\
    -u "${1}"\
    -t "${2}"\
    -i ${batteryIcon}\
    -c "Battery"\
    "Battery"\
    "${3}"
}

#==============================
# Process
#==============================

# Battery icon
# - Battery icon for notification.
batteryIcon="${HOME}/scripts/battery/img/battery.png"

# Battery path
# - It contains the information about the battery.
batteryPath="/sys/class/power_supply/BAT0"

# Battery level
# - 1 => Very low
# - 2 => Low
# - 3 => Normal
# - 4 => Almost full
# - 5 => Full
batteryLevel=3

# Process
while [ true ]; do

  # Battery status
  # - Charging
  # - Discharging
  batteryStatus=$(cat ${batteryPath}/status)

  # Battery capacity
  # - 0-100
  batteryCapacity=$(cat ${batteryPath}/capacity)

  # Full
  if [ ${batteryStatus} == "Charging" ] &&
     [ ${batteryCapacity} -eq 100 ] &&
     [ ${batteryLevel} -ne 5 ]; then

    batteryLevel=5
    notify "normal" 5000 "Battery is full!"

  # Almost full
  elif [ ${batteryStatus} == "Charging" ] &&
       [ ${batteryCapacity} -ge 85 ] &&
       [ ${batteryLevel} -ne 4 ] &&
       [ ${batteryLevel} -ne 5 ]; then

    batteryLevel=4
    notify "normal" 5000 "Battery is almost full!"

  # Normal
  elif [ ${batteryCapacity} -gt 15 ] &&
       [ ${batteryCapacity} -lt 85 ] &&
       [ ${batteryLevel} != 3 ]; then

    batteryLevel=3

  # Very low
  elif [ ${batteryStatus} == "Discharging" ] &&
       [ ${batteryCapacity} -le 5 ] &&
       [ ${batteryLevel} != 1 ]; then

    batteryLevel=1
    notify "critical" 0 "Battery is very low!"

  # Low
  elif [ ${batteryStatus} == "Discharging" ] &&
       [ ${batteryCapacity} -le 15 ] &&
       [ ${batteryLevel} != 1 ] &&
       [ ${batteryLevel} != 2 ]; then

    batteryLevel=2
    notify "normal" 5000 "Battery is low!"

  fi

  echo " ${batteryCapacity}% - ${batteryStatus}"

  # Wait
  sleep 1

done
