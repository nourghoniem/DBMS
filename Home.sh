#!/bin/bash
PS3='Welcome, Please enter your choice: '
options=("Create Database" "List Database" "Connect to Database" "Drop Database" "Quit")
select opt in "${options[@]}"
do
  case $opt in
         "Create Database")
            . create_database.sh
            break;
            ;;
          "List Database")
            . list_databases.sh
            break
            ;;
          "Connect to Database")
             . connectDb.sh
            
            break
            ;;
          "Drop Database")
            . dropDb.sh
            break
            ;;
          "Quit")
            break
            ;;
          *) echo "invalid option $REPLY";;
    esac
done
