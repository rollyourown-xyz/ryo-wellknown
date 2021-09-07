#!/bin/sh

# Remove any previously configured links in sites-enabled directory
rm * /etc/nginx/sites-enabled/

# Create a link for wellknown in sites-enabled directory
ln -s /etc/nginx/sites-available/wellknown /etc/nginx/sites-enabled/

# Reload nginx
systemctl reload nginx
