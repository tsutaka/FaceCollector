
echo '**Delete resource group**'
az group list
az group delete --name MySQL --yes
az group list
