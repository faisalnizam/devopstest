#! /bin/bash 

cd /home/devopstest/skeleton/terraform/variables/ 

IP_OF_INSTANCES=`terraform output ip` 


for i in $(echo $IP_OF_INSTANCES | sed "s/,/ /g")
do
    # call your procedure/other scripts here below
    echo "$i"
done

parent_path=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )

echo $parent_path 
cd "$parent_path"
