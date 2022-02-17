#!/bin/bash

. tmenu.sh


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
   
 
      
     

