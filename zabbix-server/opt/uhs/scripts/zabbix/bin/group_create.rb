#!/usr/bin/ruby
#-*- coding: UTF-8 -*-
$LOAD_PATH.unshift(File.dirname(__FILE__))

# This script is used to create hostgroup

def group_create(element)
  name = element["group"]
  auth = element["auth"]
  body = {
    "jsonrpc" => "2.0",
    "method" => "hostgroup.create",
    "params" => {
    "name" => name
      },
    "auth" => auth,
    "id" => rand(9999)
  }
  result = json_body(body)
  # puts result
  result = result["groupids"]
  result = result[0]
  # puts result
  # return will be group id
  return result
end

