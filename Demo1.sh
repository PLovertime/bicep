#/bin/bash
source conf/config.cfg
echo "Creating resource group: $RG"
az group create --location westeurope --name $RG --no-wait
az group create --location westeurope --name $RG1
echo "Resource group created"
az group list -o table|grep $RG1