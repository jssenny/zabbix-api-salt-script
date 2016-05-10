#!/usr/bin/ruby
#-*- coding: UTF-8 -*-
$LOAD_PATH.unshift(File.dirname(__FILE__))

def item_update(element)
  host_id = element["tempid"]
  item_id = element["itemid"]
  app_id = element["appid"]
  auth = element["auth"]
  body = {
    "jsonrpc" => "2.0",
    "method" => "item.update",
    "params" => {
      "itemid" => item_id,
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
      "delay" => element["delay"],
      "status" => element["status"]
    },
    "auth" => auth,
    "id" => rand(9999)
    }
  result = json_body(body)
  result = result["itemids"]
  result = result[0]
  return result  
end
