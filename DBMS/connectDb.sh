#!/bin/bash

. tmenu.sh
export bold=$(tput bold)
export normal=$(tput sgr0)
echo "${bold}Please enter the Database name ${normal}"
read  name
# check if the given name is a directory and exists in db folder
 
  if [ -d  Databases/$name/ 2> errors.err ];then
       
      #cd  Databases/$name
      echo "${bold}Connected to Database $name ${normal}"
      export name=$name;
      Menu
      
  else
     echo "${bold}Database $name doesn't exist ${normal}"
     . Home.sh    
   fi
  
   
 
      
     

