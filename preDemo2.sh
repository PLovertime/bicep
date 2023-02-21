#/bin/bash
source conf/config.cfg

az deployment sub create \
  --name deny-Compute-SKU-policy \
  --location swedencentral --template-file fundamental/DenyComputeSku.bicep -c
