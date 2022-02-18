#!/bin/bash
if [[ $(ls -A) ]]; then
   ls -r Databases
else
    echo "${bold}no databases found${normal}"
fi
. Home.sh
