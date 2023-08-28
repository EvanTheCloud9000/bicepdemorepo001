param location string = 'westus3'
param strorageName string = 'ga-storage$${uniqueString(resourceGroup().id)}'

resource storageaccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: strorageName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}

