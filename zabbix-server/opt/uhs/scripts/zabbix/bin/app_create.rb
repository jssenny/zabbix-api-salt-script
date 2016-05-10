#!/usr/bin/ruby
#-*- coding: UTF-8 -*-
$LOAD_PATH.unshift(File.dirname(__FILE__))

def app_create(element)
  name = element["app"]
  host_id = element["tempid"]
  auth = element["auth"]
  body = {
    "jsonrpc" => "2.0",
    "method" => "application.create",
    "params" => {
      "name" => name,
      "hostid" => host_id
    },
    "auth" => auth,
    "id" => rand(9999)
  }
  result = json_body(body)
  result = result["applicationids"][0]
  return result
end

