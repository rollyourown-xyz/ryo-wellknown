terraform {
  required_version = ">= 0.15"
  required_providers {
    consul = {
      source = "hashicorp/consul"
      version = "~> 2.12.0"
    }
  }
}

resource "consul_keys" "wellknown_redirect_domains" {

  for_each = var.wellknown_redirect_rules
  
  # The wellknown domain is the key. The value is empty.
  key {
    path   = join("", [ "service/wellknown/domains/", each.value["wellknown_domain"] ])
    value  = ""
    delete = true
  }
}

resource "consul_keys" "wellknown_json_domains" {

  for_each = var.wellknown_json_rules
  
  key {
    path   = join("", [ "service/wellknown/domains/", each.value["wellknown_domain"] ])
    value  = ""
    delete = true
  }
}

resource "consul_keys" "wellknown_redirect_rules_location" {

  for_each = var.wellknown_redirect_rules
  
  key {
    path   = join("", ["service/wellknown/redirects/", each.value["wellknown_domain"], "/", each.key, "/location"])
    value  = each.value["wellknown_path"]
    delete = true
  }
}

resource "consul_keys" "wellknown_redirect_rules_url" {

  for_each = var.wellknown_redirect_rules
  
  key {
    path   = join("", ["service/wellknown/redirects/", each.value["wellknown_domain"], "/", each.key, "/url"])
    value  = each.value["wellknown_redirect_url"]
    delete = true
  }
}

resource "consul_keys" "wellknown_json_rules_location" {

  for_each = var.wellknown_json_rules
  
  key {
    path   = join("", ["service/wellknown/json/", each.value["wellknown_domain"], "/", each.key, "/location"])
    value  = each.value["wellknown_path"]
    delete = true
  }
}

resource "consul_keys" "wellknown_json_rules_payload" {

  for_each = var.wellknown_json_rules
  
  key {
    path   = join("", ["service/wellknown/json/", each.value["wellknown_domain"], "/", each.key, "/payload"])
    value  = each.value["wellknown_json_payload"]
    delete = true
  }
}
