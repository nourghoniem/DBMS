. tmenu.sh
function checkIfTableExists(){
     ifexists=""
     if [ -f "/DBMS/Databases/$name/MetaData/${table_name}.csv" ]; then
          echo "file exists."
          ifexists="true";
         
     else 
          touch ./Databases/$name/MetaData/${table_name}.csv
          touch ./Databases/$name/Data/${table_name}.csv
          ifexists="false";

     fi
     echo $ifexists;
}


#!/bin/bash
shopt -s extglob
echo "enter the name of the table you want to create";
while true
   do
      read table_name;
      if [ -z "$table_name" ]; then
         echo "Table name should not be empty";
      elif [[ $table_name =~ [[:space:]] ]]; then
          echo "'$table_name' contains whitespace";
      elif [[ $table_name =~ ^[[:digit:]].* ]]; then
          echo "$table_name should not start with a number";
      else
         break;
      fi
   done
export table_name=$table_name;
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
          *) echo "enter a number";
       esac   
   done 
   #old_IFS=$IFS;
   #IFS=","
   echo "Primary Key: Enter field name:"
   read pk_fieldname;
   echo "Primary Key: Enter field  datatype: [int/string]"
   select pk_fieldtype in "int" "string"; do
    case $pk_fieldtype in
        int ) break;;
        string ) break;;
        *) echo "datatype should be either integer or string"
    esac
   done
   echo "$pk_fieldname,$pk_fieldtype,Primary Key" >> ./Databases/$name/MetaData/${table_name}.csv
   i=0;
   while [[ $i < $((num_rows-1)) ]] 
     do
      echo "Enter field name:"
      read fieldname;
      echo "Enter field datatype: [int/string]"
      select fieldtype in "int" "string"; do
        case $fieldtype in
         int ) break;;
         string ) break;;
      *) echo "datatype should be either integer or string"
    esac
   done
      echo "$fieldname,$fieldtype" >> ./Databases/$name/MetaData/${table_name}.csv
      ((i=i+1))
     done
   echo "Successfully added fields";
  
fi
Menu 
