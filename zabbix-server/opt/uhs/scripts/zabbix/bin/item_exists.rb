#!/usr/bin/ruby
#-*- coding: UTF-8 -*-
$LOAD_PATH.unshift(File.dirname(__FILE__))


def item_exists(element)
  key_ = element["key_"]
  temp = element["temp"]
  host_id = element["tempid"] 
  auth = element["auth"]
  body = {
    "jsonrpc" => "2.0",
    "method" => "item.get",
    "params" => {
      "output" => "extend",
      "hostids" => host_id,
      "search" => {
        "key_" => key_
        }
      },
    "auth" => auth,
    "id" => rand(9999)
  }

  result = json_body(body)
  if result == []
    return result
  else
    result = result[0]["itemid"]
    return result
  end
end

