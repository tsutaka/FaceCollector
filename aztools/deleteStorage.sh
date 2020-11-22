echo '**Delete resource group**'
az group list
az group delete --name Storage --yes
az group list
