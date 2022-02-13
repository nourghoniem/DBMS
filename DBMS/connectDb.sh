#!/bin/bash
echo " please enter data base name "
read  name
# check if the given name is a directory and exists in db folder
 
  if [ -d  Databases/$name/ ];then
       
      cd  Databases/$name
      echo "Connected to Database $name"
  else
     echo "data base $name doesn't exist"
        
   fi
   
      
     

