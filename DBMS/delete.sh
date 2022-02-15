#!/bin/bash
read -p " please enter table name to delete from : " ttname
read -p  " please enter id  to delete record  " iid

row=$(grep -wn $iid  Databases/$name/Data/$ttname.csv| cut -d ':' -f1);

 if [ "$row" != "" ];then
      
     sed -i.bk "${row}d" Databases/iti/Data/student.csv
     find . -name "*.bk" -type f -delete
      echo " successfully deleted "
     
 else
    echo " this id doesn't exist"
fi
