#!/bin/bash

textsize="22 78"

result=$(dialog --title " Video Terminals 1973-1993 " \
--menu "" 15 70 7 \
1 "Interactive Fiction Game: Zork" \
2 "ASCII Adventure: Nethack" \
3 "Lambda Moo: the original MMOG" \
4 "Exit from this menu to the console"  2>&1 >/dev/tty )

case $result in
    1)
        dialog --textbox ./zork1.md ${textsize}
        clear
        fizmo-console ~/zork1.z5
        ;;
    2)
        clear
        dialog --textbox ./nethack.md ${textsize}
        nethack
        ;;
    3)
	dialog --textbox ./lambdamoo.md  ${textsize}
        clear
        telnet lambda.moo.mud.org 8888
        ;;
    *)
        figlet "thanks"
        exit
        ;;
esac

# rurun
./start.sh
