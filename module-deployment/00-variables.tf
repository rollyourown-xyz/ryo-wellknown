# SPDX-FileCopyrightText: 2022 Wilfred Nicoll <xyzroller@rollyourown.xyz>
# SPDX-License-Identifier: GPL-3.0-or-later

# Input Variables
#################

variable "host_id" {
  description = "Mandatory: The host_id on which to deploy the module."
  type        = string
}

variable "image_version" {
  description = "Version of the images to deploy - Leave blank for 'terraform destroy'"
  type        = string
}


# Local variables
#################

# Configuration file paths
locals {
  module_configuration = "${abspath(path.root)}/../configuration/configuration.yml"
}

# Basic module variables
locals {
  module_id = yamldecode(file(local.module_configuration))["module_id"]
}
