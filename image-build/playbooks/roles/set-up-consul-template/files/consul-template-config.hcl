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
  wait {
    min = "2s"
    max = "10s"
  }
}

# Template for provisioning ryo-ingress-proxy for wellknown
template {
  source = "/etc/consul-template/configure-ingress-proxy.sh.ctmpl"
  destination = "/usr/local/bin/configure-ingress-proxy.sh"
  command = "/usr/local/bin/execute-configure-ingress-proxy.sh"
  wait {
    min = "2s"
    max = "10s"
  }
}
