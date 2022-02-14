
function checkIfTableExists(){
     ifexists=""
     if [ -f "/DBMS/Databases/$name/MetaData/$table_name" ]; then
          echo "file exists."
          ifexists="true";
         
     else 
          #echo "file does not exist."
          touch ./Databases/$name/MetaData/${table_name}.csv
          touch ./Databases/$name/Data/${table_name}.csv
          ifexists="false";

     fi
     echo $ifexists;
}


#!/bin/bash
shopt -s extglob
echo "enter the name of the table you want to create";
read table_name;
export table_name=$table_name
Check=$(checkIfTableExists);
if [ $Check == "false" ]; then
   echo "Successfully added table";
   while true 
     do
       echo "Please enter the number of fields"
       read num_rows;
       case $num_rows in
          @([[:digit:]]))
             export num_rows=$num_rows;
             break;
             ;;
          *)
       esac   
   done 
   old_IFS=$IFS;
   IFS=","
   echo "Primary Key: Enter field name:"
   read pk_fieldname;
   echo "Primary Key: Enter field datatype:"
   read pk_fieldtype;
   echo "$pk_fieldname,$pk_fieldtype,Primary Key" >> ./Databases/$name/MetaData/${table_name}.csv
   i=0;
   while [[ $i < $((num_rows-1)) ]] 
     do
      echo "Enter field name:"
      read fieldname;
      echo "Enter field type:"
      read fieldtype;
      echo "$fieldname,$fieldtype" >> ./Databases/$name/MetaData/${table_name}.csv
      ((i=i+1))
     done
   echo "Successfully added fields";
  
fi
