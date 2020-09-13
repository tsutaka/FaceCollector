
echo '**Delete resource group**'
az group list
az group delete --name AKSCluster --yes
az group delete --name FCACRRegistry --yes
az group delete --name NetworkWatcherRG --yes
az group delete --name DefaultResourceGroup-EJP --yes
az group list


echo '**Delete service principal**'
SP_NAME=fc-acr-service-principal
echo $SP_NAME
az ad sp list --display-name $SP_NAME
SP_ID=`az ad sp show --id http://$SP_NAME --query appId --output tsv`
echo $SP_ID
az ad sp delete --id $SP_ID
az ad sp list --display-name $SP_NAME
