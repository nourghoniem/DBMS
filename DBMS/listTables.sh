#!/bin/bash
. tmenu.sh
 tables=($(ls -A Databases/$name/Data))
   if ! [ $tables ]; then
     echo "No tables yet";
   else
      printf "\n %s\n" "|-------------Tables---------------|"
      for table in "${tables[@]}"
      do
        printf "\t\t${table%%.*}\t\t\n"
      done 
    fi
    Menu