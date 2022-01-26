#!/usr/bin/env bash

##############################################
# Créateur              : 3xpl0it.sh4d0w     #
# Date de Création      : 13-01-2022 à 06:59 #
# Date de Modification  : 20-01-2022 à 10:06 #
##############################################

##################################################################
# Projet sur Github : https://github.com/3xpl0it-Sh4d0w/UrlCheck #
##################################################################

COMMAND="$1"
ARGUMENT="$2"

SCRIPT_BANNER()
{
    DEB="\E[1;30m[ == ]\E[0m"
    LINE="\E[30m=====================================================================\E[0m \n"

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

SCRIPT_UPDATE()
{
    SCRIPT_BANNER
    printf "IN PROGRESS ! \n"
}

SCRIPT_INSTALL()
{
    SCRIPT_BANNER
    printf "IN PROGRESS ! \n"    
}

SCRIPT_UNINSTALL()
{
    SCRIPT_BANNER
    printf "IN PROGRESS ! \n"
}

SCRIPT_HELP()
{
    SCRIPT_BANNER
    printf "${DEB} USAGE : ./Url-Check.sh [argument] \n"
    printf "${LINE}"
    printf "${DEB} --gui           :  Chercher un lien avec une Interface. \n"
    printf "${DEB} --cli [lien]    :  Chercher un lien en Ligne de Commande. \n"
    printf "${DEB} --update        :  Permet de mettre à jour le Script depuis Github. \n"
    printf "${DEB} --install       :  Permet d'Installer le Script dans Répertoire '/opt/' \n"
    printf "${DEB} --uninstall     :  Permet de Désinstaller le Script du Système. \n"
    printf "${LINE}"
}

GUI_VERSION()
{
    SCRIPT_BANNER

    read -p "$(printf "${DEB} \E[33mURL À RÉVÉLER :\E[0m ")" DECODE_URL

    FINAL_LINK=$(curl -s -L -I -o /dev/null -w '%{url_effective}' ${DECODE_URL})

    SCRIPT_BANNER
    printf "${DEB} \E[33mLE LIEN REDIRIGE SUR : \n"
    printf "${DEB} \E[31m${FINAL_LINK}\E[0m \n"
    printf "${LINE}"

    read -p "$(printf "${DEB} \E[32mSOUHAITEZ-VOUS OUVRIR LE LIEN ? [ O - N ] : \E[0m")" OPEN_LINK

    if [[ (${OPEN_LINK} = "O") ]] || [[ (${OPEN_LINK} = "o") ]]
        then
            xdg-open ${FINAL_LINK} > /dev/null 2>&1
            exit

    elif [[ (${OPEN_LINK} = "N") ]] || [[ (${OPEN_LINK} = "n") ]]
        then
            SCRIPT_BANNER
            printf "${DEB} \E[32mTRÈS BIEN NOUS N'OUVRONS PAS LE LIEN\E[0m \n"
            printf "${LINE}"
            exit
        else
            SCRIPT_BANNER
            printf "${DEB} \E[31mL'ENTRÉE QUE VOUS AVEZ SAISI EST INCORRECTE \n"
            exit
    fi
}

CLI_VERSION()
{
    ARGUMENT="$1"
    
    curl -s -L -I -o /dev/null -w '%{url_effective}' $ARGUMENT
}

EXEC_OPTION()
{
    OPTION="$1"

    if [[ "$OPTION" = "--help" ]] || [[ "$OPTION" = "help" ]]
        then
            SCRIPT_HELP

    elif [[ "$OPTION" = "--gui" ]] || [[ "$OPTION" = "gui" ]]
        then
            GUI_VERSION

    elif [[ "$OPTION" = "--cli" ]] || [[ "$OPTION" = "cli" ]]
        then
            CLI_VERSION $ARGUMENT

    elif [[ "$OPTION" = "--install" ]] || [[ "$OPTION" = "install" ]]
        then
            SCRIPT_INSTALL

    elif [[ "$OPTION" = "--update" ]] || [[ "$OPTION" = "update" ]]
        then
            SCRIPT_UPDATE

    elif [[ "$OPTION" = "--uninstall" ]] || [[ "$OPTION" = "uninstall" ]]
        then
            SCRIPT_UNINSTALL
        else
            SCRIPT_HELP
    fi
}
EXEC_OPTION $OPTION
