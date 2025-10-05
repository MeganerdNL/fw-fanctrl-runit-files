#!/bin/sh

case "$1 $2" in
  "pre suspend" | "pre suspend-then-hibernate" | "pre hibernate")
    /usr/local/bin/fw-fanctrl pause
    ;;
  "post suspend" | "post suspend-then-hibernate" | "post hibernate")
    /usr/local/bin/fw-fanctrl resume
    ;;
  *)
    :
    ;;
esac
