# AKS cluster

resource "azurerm_kubernetes_cluster" "aks" {
  azure_policy_enabled = true
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks-${var.region}"
  kubernetes_version  = var.aks_k8s_version

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = var.aks_vm_size
    upgrade_settings {
      max_surge = "10%"
    }
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
        Environment = "Production"
        location = var.location
    }
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw

  sensitive = true
}