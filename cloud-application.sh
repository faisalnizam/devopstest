#! /bin/bash 

# Include Functions Files Here 
# =========================== # 

source skeleton/bash/functionsnheaders/howtouse.sh
source skeleton/bash/functionsnheaders/checkprereq.sh
# Function Files Include Ends Here 
# ============================ # 

echo "========================================" 
echo "DevOps Application Requested by Noon.com" 
echo "========================================" 
echo "" 

if [ "$1" = "--help" ] 
then
  echo "" 
  echo "Function Under Construction For Later Releases" 
  echo "" 

elif [ "$#" -ne 4 ] 
then
  howtouse 
  exit 1 

elif [ "$#" -eq 4 ] 
then 
  echo "" 
  echo "All 4 Parameters Recieved where" 
  
	for arguments in "$@"
	 do
 	   echo "Arguments Passed Are $arguments"
	done

  if check_pre_req terraform; then 
	echo "" 
	echo "Terra Form Installed" 
  else 
	 echo "Install Terra Form" 
  fi # If Check Ends For Command Terraform 



fi 
