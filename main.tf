resource "azurerm_resource_group" "tit" {
  name     = var.name
  location = var.location
}
resource "azurerm_app_service_plan" "tat" {
  name                = var.name
  location            = azurerm_resource_group.tit.location
  resource_group_name = azurerm_resource_group.tit.name
  sku {
    tier = "Basic"
    size = "B1"
  }
}
resource "azurerm_app_service" "tata" {
  name                = "${var.name}-appservice"
  location            = azurerm_resource_group.tit.location
  resource_group_name = azurerm_resource_group.tit.name
  app_service_plan_id = azurerm_app_service_plan.tat.id
  site_config {
    dotnet_framework_version = "v4.0"
    remote_debugging_enabled = true
    remote_debugging_version = "VS2019"
  }
}