#!/bin/sh
#
# z3bra - 2014 (c) wtfpl
# focus a window when it is created
# depends on: wew focus.sh

wew | while IFS=: read ev wid; do
    case $ev in
        # window creation: center window on the screen (except docks, menus or similar)
        16) wattr o $wid || center.sh $wid ;;

        # mapping requests: just set a special border for docks, menus and
        # similar. Focus other windows
        19) wattr o $wid \
            && chwb -s 2 -c 0x323232 $wid \
            || focus.sh $wid ;;

        # when a window gets deleted, focus another one
        18) wattr $(pfw) || focus.sh prev ;;

        # when a window gets deleted, focus another one
        17) wattr $(pfw) || focus.sh prev ;;


        # Focus windows when the mouse cursor enter them
        7) wattr o $wid || focus.sh $wid ;;
    esac
done
