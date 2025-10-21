#!/usr/bin/env bash

SINK=1

setVolume () {
  pactl -- set-sink-volume ${SINK} ${1}%
}

getVolume() {
  # Declaration(s)
  isMuted=$(\
    pactl list sinks |\
    awk '/Mute/ { print $2 }'\
  )
  currentVolume=$(pactl list sinks |\
    grep '^[[:space:]]Volume:' |\
    sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'\
  )
  # Check if muted
  [ ${isMuted} == "yes" ] && currentVolume="0"
  # Display the current volume
  echo ${currentVolume}
}

mute() {
  pactl set-sink-mute ${SINK} toggle
}

# Default value for  BLOCK_BUTTON
[ -z ${BLOCK_BUTTON} ] && BLOCK_BUTTON=0

# Event controlling
case ${BLOCK_BUTTON} in
  1) mute ;; # Left mouse button
  4) setVolume +1 ;; # Scroll up
  5) setVolume -1 ;; # Scroll down
esac

getVolume
