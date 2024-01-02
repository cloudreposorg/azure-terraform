#################### Log Analytics Workspace #################33
resource "azurerm_log_analytics_workspace" "loganalytics_workspace" {
  name                = "loganalytics-workspace"
  resource_group_name = azurerm_resource_group.Dev_RG.name
  location            = azurerm_resource_group.Dev_RG.location
}