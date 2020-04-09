# Manage your alerts programmatically

# This set of Powershell commands show how to query programmatically for alerts generated against your subscription.


# Prerequisites

# Install the Resource Graph module from PowerShell Gallery
Install-Module -Name Az.ResourceGraph

# Get a list of commands for the imported Az.ResourceGraph module
Get-Command -Module 'Az.ResourceGraph' -CommandType 'Cmdlet'


### Sample Queries

# This query searchs for alerts in a specific subscription

Search-AzGraph -Query "AlertsManagementResources | where type =~ 'Microsoft.AlertsManagement/alerts' and subscriptionId =~ '<your subscription id>' "

# Same query but listing specific fields

Search-AzGraph -Query "AlertsManagementResources | where type =~ 'Microsoft.AlertsManagement/alerts' and subscriptionId =~ '<your subscription id>' | project name, type, resourceGroup"

# In case you want to build a JSON object that contains the common alert metadata

Search-AzGraph -Query "AlertsManagementResources | where type =~ 'Microsoft.AlertsManagement/alerts' and subscriptionId =~ '<your subscription id>' | project properties | summarize buildschema(properties)"

