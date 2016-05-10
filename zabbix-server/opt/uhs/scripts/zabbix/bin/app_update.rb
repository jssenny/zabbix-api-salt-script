#!/usr/bin/ruby
#-*- coding: UTF-8 -*-
$LOAD_PATH.unshift(File.dirname(__FILE__))


def app_update(element)
  name = element["app"]
  app_id = element["appid"] 
  auth = element["auth"]
  body = {
      "jsonrpc" => "2.0",
      "method" => "application.update",
      "params" => {
        "applicationid" => app_id,
        "name" => name
      },
      "auth" => auth,
      "id" => rand(9999)
    }
    result = json_body(body)
    result = result["applicationids"]
    result = result[0]
    return result
end

