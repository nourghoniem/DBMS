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
            . delete.sh
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
