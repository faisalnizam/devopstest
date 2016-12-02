#! /bin/bash 


function initiate_infra_using_terraform { 

echo "Appname Received : $1" 
echo "Environment Name Received : $2" 
echo "Number of Servers Received: $3" 


PWD=`pwd` 
cd $PWD/skeleton/terraform/variables/

#Run TerraForm Command With Arguments Suppled 
terraform plan -detailed-exitcode  -var 'app_name='$1 -var 'environment_name='$2 -var 'total_number_of_machines='$3 -var 'public_key_path=/home/devopstest/.ssh/id_rsa.pub'


#Create Infrastructure 
terraform apply -var 'app_name='$1 -var 'environment_name='$2 -var 'total_number_of_machines='$3 -var 'public_key_path=/home/devopstest/.ssh/id_rsa.pub'


cd - 
} 
