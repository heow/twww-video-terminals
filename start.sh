#!/bin/bash

# current working directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function everything {
textsize="22 78"

result=$(dialog --nocancel --title " Video Terminals 1973-1993 " \
--menu "" 15 70 7 \
1 "Interactive Fiction Game: Zork" \
2 "ASCII Adventure: Nethack" \
3 "Lambda Moo: the original MMOG" \
4 "Slack the group messaging app" 2>&1 >/dev/tty )

case ${result} in
    1)
        dialog --exit-label "OK" --textbox ${DIR}/zork1.md ${textsize}
        dialog --yesno "Play Zork?" 0 0
        if [ "0" -eq "$?" ]; then
            clear
            fizmo-console ./media/zork1.z5
        fi
        ;;
    2)
        dialog --exit-label "OK" --textbox ${DIR}/nethack.md ${textsize}
        dialog --yesno "Play Nethack?" 0 0
        if [ "0" -eq "$?" ]; then
            clear
            nethack
        fi
        ;;
    3)
	dialog --exit-label "OK" --textbox ${DIR}/lambdamoo.md  ${textsize}
        dialog --yesno "Login to LambdaMOO?" 0 0
        if [ "0" -eq "$?" ]; then
            clear
            telnet lambda.moo.mud.org 8888
        fi
        ;;
    4)
	dialog --exit-label "OK" --textbox ${DIR}/slack.md  ${textsize}
        dialog --yesno "Login to Makelab's group chat Slack?" 0 0
        if [ "0" -eq "$?" ]; then
            clear
            /usr/local/bin/slacker
        fi
        ;;
    *)
        figlet "thanks"
        sleep 2
        ;;
esac
}

while true; do everything; done
