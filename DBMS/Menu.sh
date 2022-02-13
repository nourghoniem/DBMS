#!/bin/bash
PS3=' '$name ' :, Please enter your choice: '
options=("Create Table" "List Table" "Display Table" "Drop Table" "Insert into Table", "Select from Table", "Delete from Table", "Go to main page")
select opt in "${options[@]}"
do
  case $opt in
         "Create Table")
            echo "creating table"
            break;
            ;;
          "List Table")
            echo "listing table"
            break
            ;;
          "Display Table")
            echo "displaying table"
            break
            ;;
          "Drop Table")
            echo "Dropping table"
            break
            ;;
           "Insert into Table")
            echo "Inserting into Table"
            break
            ;;
           "Select from Table")
            echo "Selecting from Table"
            break
            ;;
           "Delete from Table")
            echo "Deleting from Table"
            break
            ;; 
          "Go to main page")
            . Home.sh
            break
            ;;
          *) echo "invalid option $REPLY";;
    esac
done
