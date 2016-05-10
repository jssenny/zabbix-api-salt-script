#!/usr/bin/ruby
#-*- coding: UTF-8 -*-
$LOAD_PATH.unshift(File.dirname(__FILE__))

def get_auth()
user = "Admin"
password = "zabbix"
  body = {
           "jsonrpc" => "2.0",
           "method" => "user.login",
           "params" => {
                        "user" => user,
                        "password" => password
           },
           "id" => rand(9999)
  }

  result = json_body(body)
  return result
end


