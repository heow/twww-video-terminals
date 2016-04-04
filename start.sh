#!/bin/bash

textsize="22 78"

result=$(dialog --title " Video Terminals 1973-1993 " \
--menu "" 15 70 7 \
1 "Interactive Fiction Game: Zork" \
2 "ASCII Adventure: Nethack" \
3 "Lambda Moo: the original MMOG" \
4 "Exit from this menu to the console"  2>&1 >/dev/tty )

case ${result} in
    1)
        dialog --exit-label "OK" --textbox ./zork1.md ${textsize}
        dialog --yesno "Play Zork?" 0 0
        if [ "0" -eq "$?" ]; then
            clear
            fizmo-console ./media/zork1.z5
        fi
        ;;
    2)
        dialog --exit-label "OK" --textbox ./nethack.md ${textsize}
        dialog --yesno "Play Nethack?" 0 0
        if [ "0" -eq "$?" ]; then
            clear
            nethack
        fi
        ;;
    3)
	dialog --exit-label "OK" --textbox ./lambdamoo.md  ${textsize}
        dialog --yesno "Login to LambdaMOO?" 0 0
        if [ "0" -eq "$?" ]; then
            clear
            telnet lambda.moo.mud.org 8888
        fi
        ;;
    *)
        figlet "thanks"
        exit
        ;;
esac

# rurun
./start.sh
