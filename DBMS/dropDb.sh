#!/bin/bash
echo " please enter data base name "
read del
 if [ -d  Databases/$del/ ];then
    
  read -p "Are you sure[y/n]? " -n 1 -r
	if [[  $REPLY =~ ^[Yy]$ ]];
	then
	    rm -r Databases/$del
            echo " "
           echo " $del successfully deleted"
             . Home.sh
         
	else 

           if [[  $REPLY =~ ^[Nn]$ ]];then
	   . Home.sh
	else
	  echo " "
          echo " not valid option "
          . Home.sh
           fi
	fi

 else
     echo " "
     echo " data base $del doesn't exist "
     . Home.sh
        
 fi

