#!/bin/bash

if [[ $(nmcli radio wifi) == disabled ]]; then
  nmcli radio wifi on
elif [[ $(nmcli radio wifi) == enabled ]]; then
  nmcli radio wifi off
fi
