
function checkIfTableExists(){
     ifexists=""
     if [ -f "Databases/$name/MetaData/${table}.csv" ]; then
          ifexists="true";
         
     else 
          ifexists="false";
          echo "Table doesn't exist";
     fi
     echo $ifexists;
}


#!/bin/bash
echo "Please enter the table name: "
read table
Check=$(checkIfTableExists)
if [ $Check == "true" ]; then
     rm -i Databases/$name/MetaData/${table}.csv Databases/$name/Data/${table}.csv
     echo "Table is successfully deleted";
else
     echo "Table doesn't exist";
fi
   