#!/usr/bin/ruby
#-*- coding: UTF-8 -*-
$LOAD_PATH.unshift(File.dirname(__FILE__))

def temp_exists(element)
  name = element["temp"]
  auth = element["auth"]
  body = {
    "jsonrpc" => "2.0",
    "method" => "template.get",
    "params" => {
      "output" => "extend",
      "filter" => {
        "host" => [
          name
        ]
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
    result = result[0]["templateid"]
  end
end

