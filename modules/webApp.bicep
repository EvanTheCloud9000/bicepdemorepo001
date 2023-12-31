param location string = 'westus3'

param namePrefix string = 'itosx'
param appPlanId string

param dockerImage string = 'nginxdemos/hello'
param dockerImageTag string = 'latest'

  resource webApplication 'Microsoft.Web/sites@2022-09-01' = {
    name: '${namePrefix}-${uniqueString(resourceGroup().id)}-website'
    location: location
    properties: {
      serverFarmId: appPlanId
      //httpsOnly: true
      siteConfig: {
        appSettings: [
          {
            name: 'DOCKER_REGISTRY_SERVICE_URL'
            value: 'https://index.docker.io'
          }
          {
            name: 'DOCKER_REGISTRY_SERVER_USERNAME'
            value: ''
          }
          {
            name: 'DOCKER_REGISTRY_SERVER_PASSWORD'
            value: ''
          }
          {
            name: 'WEBSITES_ENABLE_APP_SERVICE_STORAGE'
            value: 'false'
          }
        ]
        linuxFxVersion: 'DOCKER|${dockerImage}:${dockerImageTag}'
      }
    }
  }

output siteUrl string = webApplication.properties.hostNames[0]
