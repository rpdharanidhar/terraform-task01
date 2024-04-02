# terraform {
#     lock {
#     backend = "oci"
#     config = {
#         tenancy_ocid     = "<your-tenancy-ocid>"
#         user_ocid        = "<your-user-ocid>"
#         fingerprint      = "<your-fingerprint>"
#         private_key_path = "<path-to-your-private-key>"
#         region           = "<oci-region>"
#         namespace        = "<your-namespace>"
#         bucket_name      = "<your-vault-bucket>"
#         compartment_id   = "<your-compartment-id>"
#     }
#     }
#     backend "oci" {
#         bucket         = "testbucket01"
#         key            = "terraform.tfstate"
#         region         = "ap-hyderabad-1"
#         endpoint       = "https://objectstorage.ap-hyderabad-1.oraclecloud.com"
#         skip_region_validation = true
#   }
# }