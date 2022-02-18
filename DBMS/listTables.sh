#!/bin/bash
. tmenu.sh
 tables=($(ls -A Databases/$name/Data))
   if ! [ $tables ]; then
     echo "${bold}No tables yet${normal}";
   else
      printf "\n %s\n" "|-------------Tables---------------|"
      for table in "${tables[@]}"
      do
        printf "\t\t${table%%.*}\t\t\n"
      done 
    fi
    Menu