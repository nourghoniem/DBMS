#!/bin/bash 
. tmenu.sh 
function checkIfTableExists(){
     
     if [ -f Databases/$name/MetaData/$tname.csv 2> errors.err ]; then
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
      drawHeader
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

function selectById(){

 read -p  " please enter id for  to display the record " iid

row=$(grep -wn "$iid"  Databases/$name/Data/$tname.csv| cut -d ':' -f1);
   if [ "$row" != "" ];then
           u=""
  drawHeader
	  for ((j=1; j<=${columns}; j++))
	    
	do
           # get columns data
	   v=$(awk -v r=$row -v c=$j -F, 'NR==r {print $c}' Databases/$name/Data/$tname.csv)
	    
	    u+="|${v}\t"
	done
	    
	    printf "$u \n"
    else
          echo " this id doesn't exist "
    fi
                      }


##### main code 
echo "please enter table name: "
read tname
 Check=$(checkIfTableExists)
 if [ $Check == "true" ];then
	    read -p " please choose 1 to  select all or 2 to select by id : "  ch
	    if [ $ch == "2" ];then
	      selectById
	    else 
	      if [ $ch == "1" ];then
	      selectALL
	      else
	      echo " not valid option "
	      fi
	    fi 
else
 echo " table doesn't exist "
fi 
  
Menu
