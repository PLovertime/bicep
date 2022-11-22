//az group create --location swedencentral --resource-group vaxc0002
//The above command creates the group
// az deployment group create --resource-group vaxc0002 --template-file ..\customNet.bicep --parameters vnetPrefix="10.131.2" -c

// Deploy this template with
// az deployment group create --resource-group lisub-rg-bic1 \ 
// --template-file .\repos\ar\bicep\initial.bicep
//@description('The number of subnets to create')
//param numberOfsubnets 

@description('VNet name')
// param vnetName string = '-vnet001'
param vnetName string = '${resourceGroup().name}-vn001'

@description('VNet Address prefix, the first two octets the rest will be added automatically')
param vnetPrefix string

param vnetAddressPrefix string = '${vnetPrefix}.0/24'

@description('Firewall 1 Prefix should be first net in vnet')
param firewallPrefix string = '${vnetPrefix}.0/27'
// param firewallPrefix string = 

@description('Firewall 1 Name')
param firewallName string = 'AzureFirewallSubnet'

@description('Subnet 1 Prefix')
//param subnet1Prefix string = '10.30.2.0/24'
param subnet1Prefix string = '${vnetPrefix}.32/27'

@description('Subnet 1 Name')
param subnet1Name string = '${resourceGroup().name}srv001'

@description('Subnet 2 Prefix')
//param subnet2Prefix string = '10.30.3.0/24'
param subnet2Prefix string = '${vnetPrefix}.64/27'

@description('Subnet 2 Name')
param subnet2Name string = '${resourceGroup().name}srv002'

@description('AzureBastionSubnet')
param azureBastionsubnet string = 'AzureBastionSubnet'
param aBsn string = '${vnetPrefix}.96/27'

@description('DMZ network')
param subnet3Name string = '${resourceGroup().name}dmz001'
param subnet3Prefix string = '${vnetPrefix}.128/27'

@description('Location for all resources.')
param location string = resourceGroup().location


resource vnet 'Microsoft.Network/virtualNetworks@2021-08-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix 
      ]
    }
    subnets: [
      {
        name: firewallName
        properties: {
          addressPrefix: firewallPrefix
        }
      }
      {
        name: subnet1Name
        properties: {
          addressPrefix: subnet1Prefix
        }
      }
      {
        name: subnet2Name
        properties: {
          addressPrefix: subnet2Prefix
        }
      }
      {
        name: subnet3Name
        properties: {
          addressPrefix: subnet3Prefix
        }
      }
      {
        name: azureBastionsubnet
        properties: {
          addressPrefix: aBsn
        }
      }
    ]
  }
}
