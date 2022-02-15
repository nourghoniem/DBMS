#!/bin/bash
cd Databases
if [[ $(ls -A) ]]; then
   ls
else
    echo "no databases found"
fi
