#!/usr/bin/ruby
#-*- coding: UTF-8 -*-
$LOAD_PATH.unshift(File.dirname(__FILE__))

def temp_create(element)
  name = element["temp"]
  group_id = element["groupid"]
  auth = element["auth"]
  body = {
    "jsonrpc" => "2.0",
    "method" => "template.create",
    "params" => {
      "host" => name,
      "groups" => group_id,
    },
    "auth" => auth,
    "id" => rand(9999)
    }
  result = json_body(body)
  result = result["templateids"][0]
  return result
end


