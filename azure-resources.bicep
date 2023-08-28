param location string = 'westus3'
param strorageName string = 'gastorage${uniqueString(resourceGroup().id)}'

resource storageaccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: strorageName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }

}
