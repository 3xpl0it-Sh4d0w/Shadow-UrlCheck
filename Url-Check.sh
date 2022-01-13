#!/usr/bin/env bash

##############################################
# Créateur              : 3xpl0it.sh4d0w     #
# Date de Création      : 13-01-2022 à 06:59 #
# Date de Modification  : 13-01-2022 à 07:00 #
##############################################

##################################################################
# Projet sur Github : https://github.com/3xpl0it-Sh4d0w/UrlCheck #
##################################################################

VERSION="1.0"

DIR_LOGS="logs/"
DIR_TEMP="temp/"

DEB="\E[1;30m[ == ]\E[0m"
LINE="\E[30m=====================================================================\E[0m \n"

SCRIPT_BANNER()
{
  clear
  printf "${LINE}"
  printf "\E[30m[ \E[1;36m██╗   ██╗██████╗ ██╗      ██████╗██╗  ██╗███████╗ ██████╗██╗  ██╗\E[30m ]\E[0m \n"
  printf "\E[30m[ \E[1;36m██║   ██║██╔══██╗██║     ██╔════╝██║  ██║██╔════╝██╔════╝██║ ██╔╝\E[30m ]\E[0m \n"
  printf "\E[30m[ \E[1;36m██║   ██║██████╔╝██║     ██║     ███████║█████╗  ██║     █████╔╝ \E[30m ]\E[0m \n"
  printf "\E[30m[ \E[1;36m██║   ██║██╔══██╗██║     ██║     ██╔══██║██╔══╝  ██║     ██╔═██╗ \E[30m ]\E[0m \n"
  printf "\E[30m[ \E[1;36m╚██████╔╝██║  ██║███████╗╚██████╗██║  ██║███████╗╚██████╗██║  ██╗\E[30m ]\E[0m \n"
  printf "\E[30m[  \E[1;36m╚═════╝ ╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝\E[30m ]\E[0m \n"
  printf "${LINE}"
}
SCRIPT_BANNER

read -p "$(printf "${DEB} \E[33mURL À RÉVÉLER :\E[0m ")" DECODE_URL

FINAL_LINK=$(curl -s -L -I -o /dev/null -w '%{url_effective}' ${DECODE_URL})

SCRIPT_BANNER
printf "${DEB} \E[33mLE LIEN REDIRIGE SUR : \n"
printf "${DEB} \E[31m${FINAL_LINK}\E[0m \n"
printf "${LINE}"

read -p "$(printf "${DEB} \E[32mSOUHAITEZ-VOUS OUVRIR LE LIEN ? [ O - N ] : \E[0m")" OPEN_LINK

if [[ (${OPEN_LINK} = "O") ]] || [[ (${OPEN_LINK} = "o") ]] || \
[[ (${OPEN_LINK} = "OUI") ]] || [[ (${OPEN_LINK} = "oui") ]]
    then
        xdg-open ${FINAL_LINK} > /dev/null 2>&1
        exit
elif [[ (${OPEN_LINK} = "N") ]] || [[ (${OPEN_LINK} = "n") ]] || \
[[ (${OPEN_LINK} = "NON") ]] || [[ (${OPEN_LINK} = "non") ]]
    then
        SCRIPT_BANNER
        printf "${DEB} \E[32mTRÈS BIEN NOUS N'OUVRONS PAS LE LIEN\E[0m \n"
        printf "${LINE}"

        exit
    else
        SCRIPT_BANNER
        printf "${DEB} \E[31mL'ENTRÉE QUE VOUS AVEZ SAISI EST INCORRECTE \n"
        printf "${LINE} \n"

        exit
fi