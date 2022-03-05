#!/bin/sh
# SPDX-FileCopyrightText: 2022 Wilfred Nicoll <xyzroller@rollyourown.xyz>
# SPDX-License-Identifier: GPL-3.0-or-later

# Remove any previously configured links in sites-enabled directory
rm /etc/nginx/sites-enabled/*

# Create a link for wellknown in sites-enabled directory
ln -s /etc/nginx/sites-available/wellknown /etc/nginx/sites-enabled/

# Reload nginx
service nginx reload
