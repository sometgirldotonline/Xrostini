#!/bin/sh
echo Xrostini requires the "toilet" package to run... Make sure it is installed before continuing
toilet -f mono12 -F gay Xrostini
echo "Created by Lily (http://github.com/sometgirldotonline/Xrostini)"
echo "Usage:"
echo "[kde|xfce|lxde|die]"
echo "kde: runs the kde desktop"
echo "xfce: runs the xfce desktop"
echo "lxde: runs the lxde desktop"
echo "die: closes all sessions"
export DISPLAY=:0
case $1 in
  kde)
    sudo pkill Xephyr
    sudo pkill gdm
    sudo pkill gnome-session
    sudo pkill plasma
	sudo pkill kwin
	sudo pkill kwin_x11
    Xephyr :100 -ac -br -noreset -fullscreen -resizeable -dpi 200 -screen 1920x1200 &
    export DISPLAY=:100 && startplasma-x11
    ;;
  
  xfce)
    sudo pkill Xephyr
    sudo pkill xfce
    Xephyr :101 -ac -br -noreset -fullscreen -resizeable -dpi 200 -screen 1920x1080 &
    sudo -g root DISPLAY=:101 startxfce4
    ;;

  lxde)
    sudo pkill Xephyr
    sudo pkill lxde
    Xephyr :102 -ac -br -noreset -fullscreen -resizeable -dpi 200 -screen 1920x1080 &
    export DISPLAY=:102 && startlxde
    ;;

  die)
    sudo pkill Xephyr
    sudo pkill plasma
    sudo pkill xfce
    sudo pkill lxde
    ;;

  *)
    echo "Invalid option. Usage: de.sh [kde|xfce|lxde|die]"
    ;;
esac
