#!/bin/bash

if [[ $(ls -A) ]]; then
   ls -r  Databases
else
    echo "no databases found"
fi

. Home.sh
