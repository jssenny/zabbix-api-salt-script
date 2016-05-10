#!/usr/bin/ruby
#-*- coding: UTF-8 -*-

#$LOAD_PATH.unshift(File.dirname(__FILE__))

#require "net/http"
#require "json"
#require "uri"

def json_body(_body)
  server_ip = "127.0.0.1"
  @uri = URI.parse("http://#{server_ip}/zabbix/api_jsonrpc.php")
  json_body = JSON.generate(_body)
  connection = Net::HTTP.new(@uri.host, @uri.port)
  request = Net::HTTP::Post.new(@uri.request_uri)
  request.add_field('Content-Type', 'application/json-rpc')
  request.body = json_body
  # puts json_body
  response = connection.request(request)
  # puts response
  result = JSON.parse(response.body)
  # puts result
  result = result["result"]
  return result
end



