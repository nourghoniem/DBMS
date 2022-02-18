#!/bin/bash
. tmenu.sh
read -p " ${bold}please enter table name to delete from : ${normal}" ttname
read -p  " ${bold}please enter id  to delete record ${normal} " iid
if ! [ -f Databases/$name/Data/$ttname.csv ]; then
  echo "${bold}table doesn't exist${normal}"
else
  row=$(grep -wn "$iid"  Databases/$name/Data/$ttname.csv| cut -d ':' -f1);

  if [ "$row" != "" ];then
      
     sed -i.bk "${row}d" Databases/$name/Data/$ttname.csv
     find . -name "*.bk" -type f -delete
      echo "${bold} successfully deleted ${normal}"
     
  else
     echo "${bold} this id doesn't exist ${normal}"
   fi
fi
Menu