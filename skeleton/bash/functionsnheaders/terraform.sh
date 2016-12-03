#! /bin/bash 


function initiate_infra_using_terraform { 

echo ""
echo "Appname Received : $1" 
echo ""
echo "Environment Name Received : $2" 
echo ""
echo "Number of Servers Received: $3" 
echo ""


parent_path=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )

PWD=`pwd` 
cd $PWD/skeleton/terraform/variables/

#Run TerraForm Command With Arguments Suppled 
#terraform plan -detailed-exitcode  -var 'app_name='$1 -var 'environment_name='$2 -var 'total_number_of_machines='$3 -var 'public_key_path=/home/devopstest/.ssh/id_rsa.pub'


#Create Infrastructure 
#terraform apply -var 'app_name='$1 -var 'environment_name='$2 -var 'total_number_of_machines='$3 -var 'public_key_path=/home/devopstest/.ssh/id_rsa.pub'


IP_OF_INSTANCES=`terraform output ip`


for i in $(echo $IP_OF_INSTANCES | sed "s/,/ /g")
do
    # call your procedure/other scripts here below
    #echo "$i"
    echo "$i" >> /home/devopstest/skeleton/ansible/hosts 
done

cd - 

} 

