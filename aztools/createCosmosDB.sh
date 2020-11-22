echo '**Create CosmosDB resource group**'
COSMOSDB_RES_GROUP=CosmosDB
echo $COSMOSDB_RES_GROUP

az group create -g $COSMOSDB_RES_GROUP -l japaneast
az group list

echo '**Create CosmosDB**'
COSMOSDB_NAME=fccosmosdb
echo $COSMOSDB_NAME
az cosmosdb create \
  --name $COSMOSDB_NAME \
  --resource-group $COSMOSDB_RES_GROUP

echo '**Create SQL container in CosmosDB**'
DB_NAME=fcdb
echo $DB_NAME
CONTAINER_NAME=fcdbcontainer
echo $CONTAINER_NAME
az cosmosdb sql container create \
  --account-name $COSMOSDB_NAME \
  --database-name $DB_NAME \
  --name $CONTAINER_NAME \
  --partition-key-path "/category" \
  --resource-group $COSMOSDB_RES_GROUP
