#!/usr/bin/ruby
#-*- coding: UTF-8 -*-
$LOAD_PATH.unshift(File.dirname(__FILE__))

def host_exists(element)
  name = element["host"]
  auth = element["auth"]
  body = {
    "jsonrpc" => "2.0",
    "method" => "host.get",
    "params" => {
       "output" => "extend",
       "templated_hosts" => true,
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
  if result != []
    result = result[0]
    result = result["hostid"]
    return result
  else
    return result
  end
end
