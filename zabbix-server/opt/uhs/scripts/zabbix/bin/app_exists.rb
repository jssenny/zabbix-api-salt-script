#!/usr/bin/ruby
#-*- coding: UTF-8 -*-
$LOAD_PATH.unshift(File.dirname(__FILE__))



def app_exists(element)
  name = element["app"]
  temp_hostid = element["tempid"]
  auth = element["auth"]
  body = {
    "jsonrpc" => "2.0",
    "method" => "application.get",
    "params" => {
      "output" => "extend",
      "hostids" => temp_hostid,
      "filter" => {
        "name" => [
          name
        ]
      }
    },
    "auth" => auth,
    "id" => rand(9999)
  }
  result = json_body(body)
  
  if result == []
    return result
  else
    result = result[0]["applicationid"]
    return result
  end
end

