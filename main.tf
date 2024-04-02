# # [DEFAULT]
# # user=ocid1.user.oc1..aaaaaaaamhfvhmiepjsfvbplxdwfmkvis4g27kcg463ornjzijau3o4rrpuq
# # fingerprint=ba:b6:18:23:95:2a:04:5d:66:bf:db:51:29:2f:0a:22
# # tenancy=ocid1.tenancy.oc1..aaaaaaaas6opxb7mejtc6wld5aotewjs3iywm4kabrq2hgfljgqvh5cytc2a
# # region=ap-hyderabad-1
# # key_file=<path to your private keyfile> # TODO

# terraform {
#   required_providers {
#     oci = {
#       source  = "hashicorp/oci"
#       version = "5.35.0"
#     }
#   }
# }

# provider "oci" {
#   tenancy_ocid     = "ocid1.tenancy.oc1..aaaaaaaas6opxb7mejtc6wld5aotewjs3iywm4kabrq2hgfljgqvh5cytc2a"
#   user_ocid        = "ocid1.user.oc1..aaaaaaaamhfvhmiepjsfvbplxdwfmkvis4g27kcg463ornjzijau3o4rrpuq"
#   private_key_path = "dpushparaj@cloudvice.com_2024-04-01T07_22_11.173Z.pem"
#   fingerprint      = "ba:b6:18:23:95:2a:04:5d:66:bf:db:51:29:2f:0a:22"
#   region           = "ap-hyderabad-1"
# }

# resource "oci_core_vcn" "vcn" {
#   cidr_block     = "10.0.0.0/16"
#   compartment_id = "ocid1.compartment.oc1..aaaaaaaaqnrbg4pged5qtbb4zy4vwansmxpe4pkv3ix4tli7cjfo5uvqsyga"
#   display_name   = "vcn"
#   dns_label      = "sampledns"
# }

# resource "oci_core_subnet" "my-subnet-test" {
#   cidr_block                 = "10.0.0.0/16"
#   compartment_id             = "ocid1.compartment.oc1..aaaaaaaaqnrbg4pged5qtbb4zy4vwansmxpe4pkv3ix4tli7cjfo5uvqsyga"
#   display_name               = "my-subnet-test"
#   vcn_id                     = oci_core_vcn.vcn.id
#   availability_domain        = "GURs:AP-HYDERABAD-1-AD-1"
#   dns_label                  = "sample-dns"
#   prohibit_public_ip_on_vnic = false
# }

# resource "oci_core_network_security_group" "nsg-test" {
#   compartment_id = "ocid1.compartment.oc1..aaaaaaaaqnrbg4pged5qtbb4zy4vwansmxpe4pkv3ix4tli7cjfo5uvqsyga"
#   vcn_id         = oci_core_vcn.vcn.id
#   display_name   = "nsg-test"
# }

# resource "oci_core_internet_gateway" "testigw" {
#   compartment_id = "ocid1.compartment.oc1..aaaaaaaaqnrbg4pged5qtbb4zy4vwansmxpe4pkv3ix4tli7cjfo5uvqsyga"
#   vcn_id         = oci_core_vcn.vcn.id
#   display_name   = "testigw"
# }

# resource "oci_core_route_table" "route_table-test" {
#   vcn_id         = oci_core_vcn.vcn.id
#   compartment_id = "ocid1.compartment.oc1..aaaaaaaaqnrbg4pged5qtbb4zy4vwansmxpe4pkv3ix4tli7cjfo5uvqsyga"
#   display_name   = "route_table-test"

#   route_rules {
#     destination       = "0.0.0.0/0"
#     destination_type  = "CIDR_BLOCK"
#     network_entity_id = oci_core_internet_gateway.testigw.id
#   }
# }

# resource "oci_containerengine_cluster" "my_cluster-test" {
#   compartment_id     = "ocid1.compartment.oc1..aaaaaaaaqnrbg4pged5qtbb4zy4vwansmxpe4pkv3ix4tli7cjfo5uvqsyg"
#   name               = "my_cluster-test"
#   kubernetes_version = "v1.28.2"
#   vcn_id             = oci_core_vcn.vcn.id
#   options {
#     add_ons {
#       is_kubernetes_dashboard_enabled = true
#     }
#   }
# }
# [DEFAULT]
# user=ocid1.user.oc1..aaaaaaaamhfvhmiepjsfvbplxdwfmkvis4g27kcg463ornjzijau3o4rrpuq
# fingerprint=ba:b6:18:23:95:2a:04:5d:66:bf:db:51:29:2f:0a:22
# tenancy=ocid1.tenancy.oc1..aaaaaaaas6opxb7mejtc6wld5aotewjs3iywm4kabrq2hgfljgqvh5cytc2a
# region=ap-hyderabad-1
# key_file=<path to your private keyfile> # TODO

terraform {
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "5.35.0"
    }
  }
}

provider "oci" {
  tenancy_ocid     = var.tenancy_id
  user_ocid        = var.user_ocid
  private_key_path = "dpushparaj@cloudvice.com_2024-04-01T07_22_11.173Z.pem"
  fingerprint      = var.fingerprint
  region           = "ap-hyderabad-1"
}

resource "oci_core_vcn" "vcn" {
  cidr_block     = var.vcn_cidr_block
  compartment_id = var.compartment_id
  display_name   = "my-vcn"
}

resource "oci_core_subnet" "subnet" {
  cidr_block     = var.subnet_cidr_block
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "my-subnet"
}

resource "oci_core_network_security_group" "nsg" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "my-nsg"
}

resource "oci_core_internet_gateway" "igw" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "my-igw"
}

resource "oci_core_route_table" "route_table" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "route_table-test"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.igw.id
  }
}

resource "oci_containerengine_cluster" "my-cluster" {
  compartment_id     = var.compartment_id
  name               = "my-cluster"
  kubernetes_version = var.kubernetes_version
  vcn_id             = oci_core_vcn.vcn.id
  options {
    add_ons {
      is_kubernetes_dashboard_enabled = true
    }
  }
  # node_pools {
  #   name   = "nodepool1"
  #   subnet_ids = [oci_core_subnet.my-subnet.id]  # Specify the subnet ID(s) for the node pool
  #   node_shape = var.node_shape  # Specify the shape of the nodes in the pool
  #   quantity_per_subnet = 1  # Specify the number of nodes per subnet
  # }
}
