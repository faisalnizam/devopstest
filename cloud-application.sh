#! /bin/bash 

# Include Functions Files Here 
# =========================== # 

source skeleton/bash/functionsnheaders/howtouse

# Function Files Include Ends Here 
# ============================ # 

echo "========================================" 
echo "DevOps Application Requested by Noon.com" 
echo "========================================" 
echo "" 

if [ "$#" -ne 1 ]
then
  echo "Usage: ..."
  exit 1
fi

