variable "region" {
    description = "The region in which the resources will be deployed"
    default     = "canada"
}

variable "location" {
    description = "The location in which the resources will be deployed"
    default     = "Canada Central"
  
}

variable "aks_cluster_name" {
    description = "The name of the AKS cluster"
    default     = "aks-cluster"
}

variable "aks_k8s_version" {
    description = "The version of Kubernetes to use for the AKS cluster"
    default     = "1.29.2"
  
}

variable "aks_vm_size" {
    description = "The size of the VMs in the AKS cluster"
    default     = "Standard_D2_v4"
  
}