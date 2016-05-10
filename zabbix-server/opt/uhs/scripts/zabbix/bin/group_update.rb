#!/usr/bin/ruby
#-*- coding: UTF-8 -*-
$LOAD_PATH.unshift(File.dirname(__FILE__))

def group_update(element)
  name = element["group"]
  group_id= element["groupid"]
  auth = element["auth"]
    body = {
      "jsonrpc" => "2.0",
      "method" => "hostgroup.update",
      "params" => {
        "groupid" => group_id,
        "name" => name
      },
      "auth" => auth,
      "id" => rand(9999)
    }
    result = json_body(body)
    result = result["groupids"]
    result = result[0]
    return result
end 


