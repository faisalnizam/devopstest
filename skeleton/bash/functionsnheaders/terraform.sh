#! /bin/bash 


function initiate_infra_using_terraform { 

echo "Appname Received : $1" 
echo "Environment Name Received : $2" 
echo "Number of Servers Received: $3" 


PWD=`pwd` 
cd $PWD/skeleton/terraform/variables/

#Run TerraForm Command With Arguments Suppled 
terraform plan -var 'total_number_of_machines='$3

cd - 
} 
