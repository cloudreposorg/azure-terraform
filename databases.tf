##################### Cosmos DB Account ##################
resource "azurerm_cosmosdb_account" "cosmosdb_account" {
  name                = "cosmosdb-account-kri"
  resource_group_name = azurerm_resource_group.Dev_RG.name
  location            = azurerm_resource_group.Dev_RG.location

  offer_type = "Standard"  # Change this to "Standard" or "Autoscale" based on your requirements

  consistency_policy {
    consistency_level       = "Session"
    max_interval_in_seconds = 5
    max_staleness_prefix    = 100
  }

  enable_automatic_failover = false  # Set to true if you want automatic failover
  geo_location {
    location          = azurerm_resource_group.Dev_RG.location
    failover_priority = 0
  }
}

#output "cosmosdb_endpoint" {
 # value = azurerm_cosmosdb_account.cosmosdb_account.endpoint
#}

#output "cosmosdb_key" {
 # value = azurerm_cosmosdb_account.cosmosdb_account.primary_master_key
#}