#!/usr/bin/ruby
#-*- coding: UTF-8 -*-
$LOAD_PATH.unshift(File.dirname(__FILE__))

def host_update(element)
  name = element["host"]
  host_id = element["hostid"]
  auth = element["auth"]
 
  body = {
    "jsonrpc" => "2.0",
    "method" => "host.get",
    "params" => {
      "hostids" => host_id,
       "output" => ["hostid"],
       "selectParentTemplates" => [
         "templateid"
       ]
     },
     "auth" => auth,
     "id" => rand(9999)
  }

 result = json_body(body)
 result = result[0]["parentTemplates"]
 
 body = {
    "jsonrpc" => "2.0",
    "method" => "host.update",
    "params" => {
      "hostid" => host_id,
      "templates_clear" => result
    },
    "auth" => auth,
    "id" => rand(9999)
  }
  response = json_body(body)
  #puts response
  body = {
    "jsonrpc" => "2.0",
    "method" => "host.update",
    "params" => {
      "hostid" => host_id,
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
      },
      "status" => element["status"]
    },
    "auth" => auth,
    "id" => rand(9999)
  }

  result = json_body(body)
  result = result["hostids"][0]
end

