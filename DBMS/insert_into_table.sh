. tmenu.sh
function checkIfTableExists(){
     ifexists=""
     if [ -f "Databases/$name/MetaData/${table}.csv" 2> errors.err ]; then
          ifexists="true";
         
     else 
          ifexists="false";
          echo "Table doesn't exist";
     fi
     echo $ifexists;
}

#!/bin/bash
echo "Enter the table you want to insert into";
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
            echo "Enter an/a ${fieldtype[$i]} value for attribute ${fieldnames[$i]}"
        while true
           do
               read value;
               primaryKeyInsertion=($(awk -F,  '/'"$value"'/ {print $1}' "Databases/$name/Data/${table}.csv"))
               #echo "$primaryKeyInsertion";
               if [ ${fieldtype[$i]} == "int" ]; then
                   if ! [[ $value =~ $re ]]; then
                        echo "You should enter an integer value";
                   elif [[ $i == 0 && ! -z $primaryKeyInsertion  ]]; then
                        echo "Primary Key cannot be duplicated"
                   else
                        row+="$value,"
                        break;
                fi
    
               elif [ ${fieldtype[$i]} == "string" ]; then
                    if ! [[ $value =~ $ree ]] ; then
                        echo "You should enter a string value";
                    elif [[ $i == 0 && ! -z $primaryKeyInsertion  ]]; then
                        echo "Primary Key cannot be duplicated"
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
   echo "table doesn't exist"
fi
  Menu
Menu
   

 

