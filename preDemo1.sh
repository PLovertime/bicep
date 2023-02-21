#/bin/bash
source conf/config.cfg
echo "Creating budget: $RG"
myContactEmailss='("per.lindahl@arrow.com", "other@arrow.com")'
az deployment sub create --name Budget$RG --location swedencentral --template-file fundamental/budget.bicep --parameters budgetName=budget$RG startDate=2023-02-01 endDate=2023-12-31 contactEmailss="$myContactEmailss" -c
echo "budget created"

