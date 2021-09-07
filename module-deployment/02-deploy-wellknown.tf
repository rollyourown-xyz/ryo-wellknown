# Deploy Wellknown server for rollyourown.xyz projects
######################################################

### Depoy wellknown container
resource "lxd_container" "wellknown" {

  remote     = var.host_id
  name       = "wellknown"
  image      = join("-", [ local.module_id, "wellknown", var.image_version ])
  profiles   = ["default"]
  
  config = { 
    "security.privileged": "false"
    "user.user-data" = file("cloud-init/cloud-init-basic.yml")
  }
  
  # Provide eth0 interface with dynamic IP address
  device {
    name = "eth0"
    type = "nic"

    properties = {
      name           = "eth0"
      network        = var.host_id
    }
  }
}
