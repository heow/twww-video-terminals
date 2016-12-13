#!/bin/bash

# current working directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function everything {
textsize="22 78"

result=$(dialog --nocancel --title " Video Terminals 1973-1993 " \
--menu "" 15 70 7 \
1 "About Video Terminals 1973-1993" \
2 "Interactive Fiction: Zork" \
3 "Interactive Fiction: Hitchhiker's Gude to the Galaxy" \
4 "ASCII Adventure: Nethack" \
5 "Lambda Moo: the original MMOG" \
6 "Slack the group messaging app" \
7 "Animations" \
 2>&1 >/dev/tty )

case ${result} in
    1)
        dialog --exit-label "OK" --textbox ${DIR}/README.md ${textsize}
        ;;
    2)
        dialog --exit-label "OK" --textbox ${DIR}/zork1.md ${textsize}
        dialog --yesno "Play Zork?" 0 0
        if [ "0" -eq "$?" ]; then
            clear
            fizmo-console ${DIR}/media/zork1.z5
        fi
        ;;
    3)
        dialog --exit-label "OK" --textbox ${DIR}/hgttg.md ${textsize}
        dialog --yesno "Play Hitchhiker's?" 0 0
        if [ "0" -eq "$?" ]; then
            clear
            fizmo-console ${DIR}/media/hgttg.z5
        fi
        ;;
    4)
        dialog --exit-label "OK" --textbox ${DIR}/nethack.md ${textsize}
        dialog --yesno "Play Nethack?" 0 0
        if [ "0" -eq "$?" ]; then
            clear
            nethack
        fi
        ;;
    5)
	    dialog --exit-label "OK" --textbox ${DIR}/lambdamoo.md  ${textsize}
        dialog --yesno "Login to LambdaMOO?" 0 0
        if [ "0" -eq "$?" ]; then
            clear
            telnet lambda.moo.mud.org 8888
        fi
        ;;
    6)
	dialog --exit-label "OK" --textbox ${DIR}/slack.md  ${textsize}
        dialog --yesno "Login to Makelab's group chat Slack?" 0 0
        if [ "0" -eq "$?" ]; then
            clear
            /usr/local/bin/slacker
        fi
        ;;
    7)
        clear
	cat ${DIR}/media/snowing.vt; sleep 2; clear
	cat ${DIR}/media/xmas-00.vt; sleep 2; clear
	cat ${DIR}/media/xmas-04.vt; sleep 2; clear
	cat ${DIR}/media/xmas-05.vt; sleep 2; clear
	cat ${DIR}/media/xmas-06.vt; sleep 2; clear
        ;;
    *)
        figlet "thanks"
        sleep 2
        ;;
esac
}

while true; do everything; done
