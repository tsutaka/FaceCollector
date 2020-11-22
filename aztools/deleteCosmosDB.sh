
echo '**Delete resource group**'
az group list
az group delete --name CosmosDB --yes
az group list
