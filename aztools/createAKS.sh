az login

echo '**create ACR**'
ACR_NAME=FCACRRegistry
echo $ACR_NAME

az acr check-name -n $ACR_NAME
ACR_RES_GROUP=$ACR_NAME
echo $ACR_RES_GROUP

az group create -g $ACR_RES_GROUP -l japaneast
az group list

az acr create -g $ACR_RES_GROUP -n $ACR_NAME --sku Standard -l japaneast
az acr list

echo '**build image**'
cd ~/FaceCollector
az acr build --registry $ACR_NAME --image face-collector:v0.1 v0.1/
az acr repository show-tags -n $ACR_NAME --repository face-collector

ACR_ID=$(az acr show -n $ACR_NAME --query id --output tsv)
echo $ACR_ID

echo '**create service principal**'
SP_NAME=fc-acr-service-principal
echo $SP_NAME

SP_PASSWD=$(az ad sp create-for-rbac --name $SP_NAME --role Reader --query password --output tsv)
echo $SP_PASSWD

APP_ID=$(az ad sp show --id http://$SP_NAME --query appId --output tsv)
echo $APP_ID
az ad sp show --id http://$SP_NAME

echo '**create aks cluster resource group**'
AKS_CLUSTER_NAME=AKSCluster
echo $AKS_CLUSTER_NAME

AKS_RES_GROUP=$AKS_CLUSTER_NAME
echo $AKS_RES_GROUP

az group create -g $AKS_RES_GROUP -l japaneast
az group list

echo 'Create cluster by Azure portal'
echo $APP_ID
echo $SP_PASSWD
echo 'Type following code'
echo 'az aks get-credentials --admin --resource-group AKSCluster --name AKSCluster'