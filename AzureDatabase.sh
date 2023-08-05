# Create a resource group
az group create --name myResourceGroup --location eastus

# Create an Azure SQL Database server
az sql server create --name mySqlServer --resource-group myResourceGroup --location eastus --admin-user myAdmin --admin-password myPassword

# Create a database on the server
az sql db create --name myDatabase --resource-group myResourceGroup --server mySqlServer --service-objective Basic

# Access to Azure SQL Database from local machine
az sql server firewall-rule create --resource-group myResourceGroup --server mySqlServer --name AllowLocalClient --start-ip-address <Your_Local_IP_Address> --end-ip-address <Your_Local_IP_Address>

# Get connection string
az sql db show-connection-string --server mySqlServer --name myDatabase --client ado.net

# New managed database from backup
az sql db export --resource-group myResourceGroup --server mySqlServer --name myDatabase --storage-uri https://myStorageAccount.blob.core.windows.net/backups/myDatabase.bacpac

# The New database from the backup
az sql db import --resource-group myResourceGroup --server mySqlServer --name myNewDatabase --storage-uri https://myStorageAccount.blob.core.windows.net/backups/myDatabase.bacpac
