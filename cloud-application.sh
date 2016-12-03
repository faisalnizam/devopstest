#! /bin/bash 

# Include Functions Files Here 
# =========================== # 

source skeleton/bash/functionsnheaders/howtouse.sh
source skeleton/bash/functionsnheaders/checkprereq.sh
source skeleton/bash/functionsnheaders/terraform.sh
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
        echo "Proceeding to Creating The AWS Infra using TerraForm" 

        # Go To Terraform Function Initiation of AWS Infrastructure
         initiate_infra_using_terraform $1 $2 $3 


  else 
	 echo "Install Terra Form" 
	 exit 1 
  fi # If Check Ends For Command Terraform 


  #Lets Move OnTo Ansible Now. 
  #Since We are working in HA I will create a shared DB on RDS for Wordpress Cluster 
  #Can be done with Terraform by creating a module/resource called rds. Next version will have the capability to choose from 

    if check_pre_req ansible; then
        echo "" 
        echo "Ansible Installed" 
        echo "Proceeding to Configure  Infra using Ansible" 

        # Go To Terraform Function Initiation of AWS Infrastructure
        #define_blog_definition  

  else 
       
      	 echo "-------------------"
         echo "Install Ansible" 
         echo "" 
         echo "Please remember to run terraform destroy to remove the infrastucture from AWS Account"
         echo "Version 2 will have auto removal added to it"	 
         exit 1 
  fi # If Check Ends For Command Terraform 


fi 
