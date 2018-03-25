#!/bin/sh

if ([[ $1 == wlp* ]]); then
  case "$2" in
    up)
      nmcli radio wwan off
      ;;
    down)
      nmcli radio wwan on
      ;;
  esac
fi
