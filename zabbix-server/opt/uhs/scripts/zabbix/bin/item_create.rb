#!/usr/bin/ruby
#-*- coding: UTF-8 -*-
$LOAD_PATH.unshift(File.dirname(__FILE__))

def item_create(element)
  host_id = element["tempid"]
  app_id = element["appid"]
  auth = element["auth"]
    body = {
      "jsonrpc" => "2.0",
      "method" => "item.create",
      "params" => {
        "name" => element["item"],
        "key_" => element["key_"],
        "hostid" => host_id,
        "type" => element["type"],
        "value_type" => element["value_type"],
        "units" => element["units"],
        "formula" => element["formula"],
        "multiplier" => element["multiplier"],
        "applications" => [
          app_id
        ],
        "delay" => element["delay"]
      },
      "auth" => auth,
      "id" => rand(9999)
    }
    result = json_body(body)
    result = result["itemids"][0]
    return result
end
