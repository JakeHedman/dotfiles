#!/bin/sh

if ([[ $1 == wlp* ]]); then
  case "$2" in
    up)
      nmcli radio wwan off
      ;;
    down)
      mmcli -m 0 -e
      nmcli radio wwan on
      ;;
  esac
fi
