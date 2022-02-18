#!/bin/bash
echo "Please specify the name of the database you want to create: ";
read database_name;
if [ -d "Databases/$database_name" 2> errors.err ]; then
   echo "Database already exists";
else
   mkdir Databases/$database_name;
   mkdir Databases/$database_name/Data;
   mkdir Databases/$database_name/MetaData;
   echo "Database successfully created";
fi
. Home.sh