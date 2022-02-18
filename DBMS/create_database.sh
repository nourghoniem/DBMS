#!/bin/bash
export bold=$(tput bold)
export normal=$(tput sgr0)
echo "${bold} Please specify the name of the database you want to create: ${normal}";
read database_name;
if [ -d "Databases/$database_name" 2> errors.err ]; then
   echo "${bold}Database already exists ${normal}";
else
   mkdir Databases/$database_name;
   mkdir Databases/$database_name/Data;
   mkdir Databases/$database_name/MetaData;
   echo "${bold} Database successfully created ${normal}";
fi
. Home.sh