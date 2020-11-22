echo '**Create Strorage resource group**'
STORAGE_RES_GROUP=Storage
echo $STORAGE_RES_GROUP

az group create -g $STORAGE_RES_GROUP -l japaneast
az group list

echo '**Create Strorage**'
STORAGE_NAME=fcvideostorage
echo $STORAGE_NAME
az storage account create \
  --resource-group $STORAGE_RES_GROUP \
  --name $STORAGE_NAME \
  --sku Standard_LRS

echo '**Create Strorage Container**'
STORAGE_CONTAINER_NAME1=fcinputvideo
echo $STORAGE_CONTAINER_NAME1
az storage container create \
  --name $STORAGE_CONTAINER_NAME1 \
  --account-name $STORAGE_NAME

STORAGE_CONTAINER_NAME2=fcimages
echo $STORAGE_CONTAINER_NAME2
az storage container create \
  --name $STORAGE_CONTAINER_NAME2 \
  --account-name $STORAGE_NAME

STORAGE_CONTAINER_NAME3=fcfaces
echo $STORAGE_CONTAINER_NAME3
az storage container create \
  --name $STORAGE_CONTAINER_NAME3 \
  --account-name $STORAGE_NAME