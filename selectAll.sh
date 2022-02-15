#!/bin/bash 

function checkIfTableExists(){
     ifexists=""
     if [ -f Databases/$name/MetaData/$table_name ]; then
          #echo "file exists."
          ifexists="true";
         
     else 
          #echo "file does not exist."
#          touch ./Databases/$name/MetaData/${table_name}.csv
 #         touch ./Databases/$name/Data/${table_name}.csv
          ifexists="false";

     fi
     echo $ifexists;
}
   
         
function drawHeader(){ 
header=""
decoration=""             
columns=$(wc -l < Databases/$name/MetaData/$tname.csv)                                                                   
printf "%s\n\n" "...................................... $tname table..................................................."
       for ((k=1; k<=${columns}; k++))
	    
	do
           # get columns data
	   h=$(awk -v c=$k -F, 'NR==c {print $1}' Databases/$name/MetaData/$tname.csv)
	    
	    header+="|  ${h}\t"
            decoration+="---------"
	done
            printf "$header"
            printf "%s\n""$decoration"
            printf "\n"
}
     

function selectALL(){
  rows=$(wc -l < Databases/$name/Data/$tname.csv)
  columns=$(wc -l < Databases/$name/MetaData/$tname.csv)

	for ((i=1; i<=${rows}; i++)) 
      
	   
	do
	  
	  for ((j=1; j<=${columns}; j++))
	    
	do
           # get columns data
	   v=$(awk -v r=$i -v c=$j -F, 'NR==r {print $c}' Databases/$name/Data/$tname.csv)
	    
	    x+="|${v}\t"
	done
	 
	    printf "$x \n"
	     x=""
	done }



##### main code 
echo "please enter table name: "
read tname
drawHeader
selectALL

  
