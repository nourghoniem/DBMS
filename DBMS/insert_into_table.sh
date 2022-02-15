
function checkIfTableExists(){
     ifexists=""
     if [ -f "Databases/$name/MetaData/${table}.csv" ]; then
          #echo "file exists."
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
echo $Check
if [ $Check == "true" ]; then
   fieldnames=($(awk -F, '{print $1}' "Databases/$name/MetaData/${table}.csv"))
   fieldtype=($(awk -F, '{print $2}' "Databases/$name/MetaData/${table}.csv"))
   constraints=($(awk -F, '{print $3}' "Databases/$name/MetaData/${table}.csv"))

   i=0;
   re='^[0-9]+$'
   ree=[a-zA-Z]
   while [[ $i < ${#fieldtype[@]} ]] 
       do
            echo "Enter an/a ${fieldtype[$i]} value for attribute ${fieldnames[$i]}"
        while true
           do
               read value;
               if [ ${fieldtype[$i]} == "int" ]; then
                   if ! [[ $value =~ $re ]]; then
                        echo "You should enter an integer value";
                    else
                        row+="$value,"
                        break;
                fi
    
               elif [ ${fieldtype[$i]} == "string" ]; then
                     if ! [[ $value =~ $ree ]] ; then
                        echo "You should enter a string value";
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
fi
   

 

