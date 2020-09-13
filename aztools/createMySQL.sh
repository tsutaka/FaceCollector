echo '**Create MySQL resource group**'
MYSQL_RES_GROUP=MySQL
echo $MYSQL_RES_GROUP

az group create -g $MYSQL_RES_GROUP -l japaneast
az group list

echo '**Create MySQL server**'
MYSQL_NAME=fcMySQLsvr
echo $MYSQL_NAME
az mysql server create \
  --location japaneast \
  --resource-group $MYSQL_RES_GROUP \
  --name $MYSQL_NAME \
  --admin-user myadmin \
  --admin-password Myadm1n123! \
  --sku-name B_Gen5_1

fcmysqlsvr.mysql.database.azure.com