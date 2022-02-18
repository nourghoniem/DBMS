. tmenu.sh
function checkIfTableExists(){
     ifexists=""
     if [ -f "Databases/$name/MetaData/${table}.csv" 2> errors.err ]; then
          ifexists="true";
         
     else 
          ifexists="false";
          echo "${bold}Table doesn't exist${normal}";
     fi
     echo $ifexists;
}


#!/bin/bash
echo "${bold}Please enter the table name: ${normal} "
read table
Check=$(checkIfTableExists)
if [ $Check == "true" 2> errors.err ]; then
     rm -i Databases/$name/MetaData/${table}.csv Databases/$name/Data/${table}.csv 
     echo "${bold}Table is successfully deleted${normal}";
else
     echo "${bold}Table doesn't exist${normal}";
fi
Menu  