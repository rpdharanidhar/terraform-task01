variable "compartment_id" {
  description = "The OCID of the compartment where the resources will be created."
  default     = "ocid1.compartment.oc1..aaaaaaaaqnrbg4pged5qtbb4zy4vwansmxpe4pkv3ix4tli7cjfo5uvqsyga"
}

variable "tenancy_id" {
  description = "The OCID of the tenancy where the resources will be created."
  default     = "ocid1.tenancy.oc1..aaaaaaaas6opxb7mejtc6wld5aotewjs3iywm4kabrq2hgfljgqvh5cytc2a"
}

variable "user_ocid" {
  description = "The OCID of the user where the resources will be created."
  default     = "ocid1.user.oc1..aaaaaaaamhfvhmiepjsfvbplxdwfmkvis4g27kcg463ornjzijau3o4rrpuq"
}

variable "fingerprint" {
  description = "The fingerprint of the connection."
  default     = "ba:b6:18:23:95:2a:04:5d:66:bf:db:51:29:2f:0a:22"
}

variable "vcn_cidr_block" {
  description = "The CIDR block for the VCN."
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the subnet."
  default     = "10.0.1.0/24"
}

variable "kubernetes_version" {
  description = "The version of Kubernetes to use for the cluster."
  default     = "v1.29.1"
}

variable "node_shape" {
  description = "The shape of the Kubernetes nodes."
  default     = "VM.Standard2.1"
}
