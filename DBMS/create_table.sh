
function checkIfTableExists(){
    
     if [ -f "/DBMS/Databases/$name/MetaData/$table_name" ]; then
          echo "file exists."
          Exists=true;
         
     else 
          echo "file does not exist."
          touch "Database/$name/MetaData/$table_name.csv"
          touch "Database/$name/Data/$table_name.csv"
           #echo "Databases/$name/MetaData/$table_name" 
     fi
}

#!/bin/bash
echo "enter the name of the table you want to create";
read table_name;
export table_name=$table_name
touch ./Databases/$name/MetaData/${table_name}.csv
touch ./Databases/$name/Data/${table_name}.csv
#Exists=false;
#checkIfTableExists;
