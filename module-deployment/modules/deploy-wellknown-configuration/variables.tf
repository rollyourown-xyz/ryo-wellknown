# SPDX-FileCopyrightText: 2022 Wilfred Nicoll <xyzroller@rollyourown.xyz>
# SPDX-License-Identifier: GPL-3.0-or-later

# Input variable definitions

variable "wellknown_redirect_rules" {
  description = "Map of wellknown redirect rules to deploy."
  type = map(object({
    wellknown_domain       = string
    wellknown_path         = string
    wellknown_redirect_url = string
  }))
  default = {}
}

variable "wellknown_json_rules" {
  description = "Map of wellknown JSON rules to deploy."
  type = map(object({
    wellknown_domain       = string
    wellknown_path         = string
    wellknown_json_payload = string
  }))
  default = {}
}
