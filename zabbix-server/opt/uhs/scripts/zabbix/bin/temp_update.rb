#!/usr/bin/ruby
#-*- coding: UTF-8 -*-
$LOAD_PATH.unshift(File.dirname(__FILE__))

def temp_update(element)
  name = element["temp"]
  group_id = element["groupid"]
  temp_id = element["tempid"]
  auth = element["auth"]
  body = {
      "jsonrpc" => "2.0",
      "method" => "template.update",
      "params" => {
        "templateid" => temp_id,
        "name" => name,
        "groups" => [group_id]
      },
      "auth" => auth,
      "id" => rand(9999)
    }
  result = json_body(body)
  result = result["templateids"][0]
  return result
end


