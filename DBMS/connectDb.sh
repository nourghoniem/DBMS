#!/bin/bash

function Menu(){

    PS3=' '$name': Please enter your choice: '
    options=("Create Table" "List Table" "Display Table" "Drop Table" "Insert into Table" "Select from Table" "Delete from Table" "Go to main page")
   select opt in "${options[@]}"
   do
     case $opt in
         "Create Table")
            . create_table.sh
            break;
            ;;
          "List Table")
            . listTables.sh
            break;
            ;;
          "Display Table")
            echo "displaying table"
            break;
            ;;
          "Drop Table")
            . drop_table.sh
            break;
            ;;
           "Insert into Table")
            . insert_into_table.sh
            break;
            ;;
           "Select from Table")
            . selectAll.sh
            break;
            ;;
           "Delete from Table")
            echo "Deleting from Table"
            break;
            ;; 
          "Go to main page")
            . Home.sh
            break;
            ;;
          *) echo "invalid option $REPLY";;
      esac
    done

 }


echo "Please enter the Database name "
read  name
# check if the given name is a directory and exists in db folder
 
  if [ -d  Databases/$name/ ];then
       
      #cd  Databases/$name
      echo "Connected to Database $name"
      export name=$name;
      Menu
      
  else
     echo "Database $name doesn't exist"
        
   fi
   
 
      
     

