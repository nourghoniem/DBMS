#!/bin/bash
echo "${bold} please enter database name ${normal} "
read del
 if [ -d  Databases/$del/ 2> errors.err ];then
    
  read -p "Are you sure[y/n]? " -n 1 -r
	if [[  $REPLY =~ ^[Yy]$ ]];
	then
	    rm -r Databases/$del
            echo " "
           echo "${bold} $del successfully deleted${normal}"
             . Home.sh
         
	else 

           if [[  $REPLY =~ ^[Nn]$ ]];then
	   . Home.sh
	else
	  echo " "
          echo "${bold} not valid option ${normal}"
          . Home.sh
           fi
	fi

 else
     echo " "
     echo " ${bold}data base $del doesn't exist ${normal} "
     . Home.sh
        
 fi

