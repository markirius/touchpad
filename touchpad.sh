#!/bin/bash

function touch(){
  touchpad="$(xinput | sed -n 's/.*Touchpad.*id=\([0-9][0-9]\).*/\1/p')"
  if xinput list-props $touchpad | grep "Device Enabled (.*):.*1" >/dev/null
  then
    xinput disable $touchpad
    notify-send -u low -i mouse "Touchpad disabled"
  else
    xinput enable $touchpad
    notify-send -u low -i mouse "Touchpad enabled"
  fi
}


if [[ ! "$(xinput --version)" ]]; then
  echo "Please instal xorg-xinput libs."
else
  touch
  exit
fi
