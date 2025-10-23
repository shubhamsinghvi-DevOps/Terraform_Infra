locals {
  common_tags = {
    mangedby   = "Terraform"
    owmer      = "todoappteam"
    enviroment = "test"
  }
}

module "rg_creation" {
  source      = "../../Modules/1_azurerm_resource_group"
  rg_name     = "rg_todo"
  rg_location = "central india"
  tags        = local.common_tags
}

module "acr_creation" {
  depends_on = [module.rg_creation]
  source     = "../../Modules/7_azurerm_container_registry"
  acr_name   = "acrtodo"
  rg_name    = "rg_todo"
  location   = "central india"
  tags       = local.common_tags
}

module "sql_server_creation" {
  depends_on     = [module.rg_creation]
  source         = "../../Modules/4_azurerm_mssql_server"
  sql_servername = "sql-server-todo"
  rg_name        = "rg_todo"
  location       = "central india"
  admin_password = "admin@123"
  admin_username = "admin"
  tags           = local.common_tags
}

module "sql-db-to" {
  depends_on  = [module.sql_server_creation]
  source      = "../../Modules/3_azurerm_mssql_database"
  db_name     = "db_todoapp"
  server_id   = module.sql_server_creation.server_id
  max_size_gb = "2"
  tags        = local.common_tags
}


module "aks_todoapp" {
  depends_on = [module.rg_creation]
  source     = "../../Modules/8_azurerm_kubernetes_service"
  aks_name   = "akstodoapp"
  location   = "central india"
  rg_name    = "rg_todo"
  dns_prefix = "aks-test-todoapp"
  tags       = local.common_tags
}