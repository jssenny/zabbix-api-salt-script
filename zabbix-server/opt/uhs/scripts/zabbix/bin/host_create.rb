#!/usr/bin/ruby
#-*- coding: UTF-8 -*-
$LOAD_PATH.unshift(File.dirname(__FILE__))

def host_create(element)
  name = element["host"]
  auth = element["auth"]
  body = {
    "jsonrpc" => "2.0",
    "method" => "host.create",
    "params" => {
      "host" => name,
      "interfaces" => [
        {
          "type" => 1,
          "main" => 1,
          "useip" => 1,
          "ip" => element["ip"],
          "dns" => "",
          "port" => "10050"
        }
      ],
      "groups" => element["groups"],
      "templates" => element["templates"],
      "inventory_mode" => 0,
      "inventory" => {
        "site_country" => element["site_country"],
        "type" => element["type"]
      }
    },
    "auth" => auth,
    "id" => rand(9999)
  }
  result = json_body(body)
  result = result["hostids"][0]
  return result
end
