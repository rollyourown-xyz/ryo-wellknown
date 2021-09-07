consul {
  address = "127.0.0.1:8500"
  
  auth {
    enabled = false
  }
  
  retry {
    enabled  = true
    attempts = 0
    backoff = "250ms"
    max_backoff = "1m"
  }
}

# Template for dynamic nginx configuration based on consul key-values
template {
  source = "/etc/consul-template/wellknown-sites-available.ctmpl"
  destination = "/etc/nginx/sites-available/wellknown"
  command = "/usr/local/bin/load-nginx.sh"
}

# Template for provisioning ryo-service-proxy for wellknown
#template {
#  source = "/etc/consul-template/configure-service-proxy.sh.ctmpl"
#  destination = "/usr/local/bin/configure-service-proxy.sh"
#  command = "/usr/local/bin/execute-configure-service-proxy.sh"
#}
