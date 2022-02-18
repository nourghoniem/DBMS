. tmenu.sh
function checkIfTableExists(){
     ifexists=""
     if [ -f "Databases/$name/MetaData/${table}.csv" 2> errors.err ]; then
          ifexists="true";
         
     else 
          ifexists="false";
          echo "${bold}Table doesn't exist${normal}";
     fi
     echo $ifexists;
}

#!/bin/bash
echo "${bold}Enter the table you want to insert into${normal}";
read table;
row="";
Check=$(checkIfTableExists)

if [ $Check == "true" 2> errors.err ]; then
   fieldnames=($(awk -F, '{print $1}' "Databases/$name/MetaData/${table}.csv"))
   fieldtype=($(awk -F, '{print $2}' "Databases/$name/MetaData/${table}.csv"))
   constraints=($(awk -F, '{print $3}' "Databases/$name/MetaData/${table}.csv"))
   

   i=0;
   re='^[0-9]+$'
   ree='^[A-Za-z ]+$'
   while [[ $i < ${#fieldtype[@]} ]] 
       do
            echo "${bold}Enter an/a ${fieldtype[$i]} value for attribute ${fieldnames[$i]} ${normal}"
        while true
           do
               read value;
               primaryKeyInsertion=($(awk -F,  '/'"$value"'/ {print $1}' "Databases/$name/Data/${table}.csv"))
               #echo "$primaryKeyInsertion";
               if [ ${fieldtype[$i]} == "int" ]; then
                   if ! [[ $value =~ $re ]]; then
                        echo "${bold}You should enter an integer value${normal}";
                   elif [[ $i == 0 && ! -z $primaryKeyInsertion  ]]; then
                        echo "${bold}Primary Key cannot be duplicated${normal}"
                   else
                        row+="$value,"
                        break;
                fi
    
               elif [ ${fieldtype[$i]} == "string" ]; then
                    if ! [[ $value =~ $ree ]] ; then
                        echo "${bold}You should enter a string value${normal}";
                    elif [[ $i == 0 && ! -z $primaryKeyInsertion  ]]; then
                        echo "${bold}Primary Key cannot be duplicated${normal}"
                    else
                        row+="$value,"
                        #echo "$row" >> ./Databases/$name/Data/${table}.csv
                        break;    
                      fi 
                fi
            done
             
            ((i=i+1))
        done
        echo "${row%%,}" >> ./Databases/$name/Data/${table}.csv
else
   echo "${bold}table doesn't exist${normal}"
fi
  Menu
Menu
   

 

