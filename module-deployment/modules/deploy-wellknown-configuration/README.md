<!--
SPDX-FileCopyrightText: 2022 Wilfred Nicoll <xyzroller@rollyourown.xyz>
SPDX-License-Identifier: CC-BY-SA-4.0
-->

# Deploy key-value pairs to consul KV store for providing wellknown server configuration

This module deploys key-value pairs to consul KV store for configuring -well-known redirects or JSON payloads for the wellknwon service. Configuration is specified by input variables:

## wellknown_redirect_rules (map of objects)

A map of redirect rules for .well-known paths. Each object is a map of values. The object name provides a name for the well-known rule and the object map specifies the domain and well-known path to match as well as the URL to redirect to. The form is:

    wellknown_redirect_rules {
        wellknown_rule_name = {wellknown_domain = string, wellknown_path = string, wellknown_redirect_url = string},
        wellknown_rule_name = {wellknown_domain = string, wellknown_path = string, wellknown_redirect_url = string},
        ...
    }

## wellknown_json_rules (map of objects)

A map of JSON rules for .well-known paths. Each object is a map of values. The object name provides a name for the well-known rule and the object map specifies the domain and well-known path to match as well as the JSON payload to return. The form is:

    wellknown_json_rules {
        wellknown_rule_name = {wellknown_domain = string, wellknown_path = string, wellknown_json_payload = string},
        wellknown_rule_name = {wellknown_domain = string, wellknown_path = string, wellknown_json_payload = string},
        ...
    }
