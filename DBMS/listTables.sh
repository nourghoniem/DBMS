#!/bin/bash

 tables=($(ls Databases/$name/Data))
 
   printf "\n %s\n" "|-------------Tables---------------|"
   for table in "${tables[@]}"
do
     printf "\t\t${table%%.*}\t\t\n"
  done 
   
