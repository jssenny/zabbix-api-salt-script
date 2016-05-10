#!/usr/bin/ruby
#-*- coding: UTF-8 -*-
$LOAD_PATH.unshift(File.dirname(__FILE__))

# This script is used to check if the group is existing

def group_exists(element)
  name = element["group"]
  auth = element["auth"]  
  body = {
    "jsonrpc" => "2.0",
    "method" => "hostgroup.get",
    "params" => {
      "output" => "extend",
      "filter" => {
        "name" => name
        }
      },
    "auth" => auth,
    "id" => rand(9999)
  }

  result = json_body(body)
  # puts result 
  if result == []
    return result
  else
    result = result[0]["groupid"]
    return result 
  end
end

