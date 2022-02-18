. tmenu.sh
export bold=$(tput bold)
export normal=$(tput sgr0)
function checkIfTableExists(){
     ifexists=""
     if [ -f "/DBMS/Databases/$name/MetaData/${table_name}.csv" ]; then
          echo "${bold}file exists.${normal}"
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
echo "${bold}enter the name of the table you want to create${normal}";
while true
   do
      read table_name;
      if [ -z "$table_name" ]; then
         echo "${bold}Table name should not be empty${normal}";
      elif [[ $table_name =~ [[:space:]] ]]; then
          echo "${bold}'$table_name' contains whitespace${normal}";
      elif [[ $table_name =~ ^[[:digit:]].* ]]; then
          echo "${bold} Table name should not start with a number ${normal}";
      else
         break;
      fi
   done
export table_name=$table_name;
Check=$(checkIfTableExists);
if [ $Check == "false" ]; then
   echo "${bold}Successfully added table${normal}";
   while true 
     do
       echo "${bold}Please enter the number of fields${normal}"
       read num_rows;
       case $num_rows in
          @([[:digit:]]))
             export num_rows=$num_rows;
             break;
             ;;
          *) echo "${bold}enter a number${normal}";
       esac   
   done 
   #old_IFS=$IFS;
   #IFS=","
   echo "${bold}Primary Key: Enter field name:${normal}"
   read pk_fieldname;
   echo "${bold}Primary Key: Enter field  datatype: [int/string]${normal}"
   select pk_fieldtype in "int" "string"; do
    case $pk_fieldtype in
        int ) break;;
        string ) break;;
        *) echo "${bold}datatype should be either integer or string${normal}"
    esac
   done
   echo "$pk_fieldname,$pk_fieldtype,Primary Key" >> ./Databases/$name/MetaData/${table_name}.csv
   i=0;
   while [[ $i < $((num_rows-1)) ]] 
     do
      echo "${bold}Enter field name:${normal}"
      read fieldname;
      echo "${bold}Enter field datatype: [int/string]${normal}"
      select fieldtype in "int" "string"; do
        case $fieldtype in
         int ) break;;
         string ) break;;
      *) echo "${bold}datatype should be either integer or string${normal}"
    esac
   done
      echo "$fieldname,$fieldtype" >> ./Databases/$name/MetaData/${table_name}.csv
      ((i=i+1))
     done
   echo "${bold}Successfully added fields${normal}";
  
fi
Menu