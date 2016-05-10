#!/opt/uhs/cots/ruby/bin/ruby
#-*- coding: UTF-8 -*-
$LOAD_PATH.unshift(File.dirname(__FILE__))
Dir.chdir("/opt/ruby/scripts/zabbix/beta-2.0")
path = Dir.pwd

#require "rubygems"
require "#{path}/lib/json_body.rb"
require "#{path}/lib/get_auth.rb"
require "net/http"
require "json"
require "uri"
require 'rexml/document'

path = Dir.pwd

file = File.open("#{path}/xml/export.xml")  
doc = REXML::Document.new file 

#puts doc

#=begin

# get export result
auth = get_auth
body = {
  "jsonrpc" => "2.0",
  "method" => "configuration.import",
  "params" => {
    "format" => "xml",
    "rules" => {
      "hosts" => {
        "createMissing" => true,
        #"deleteMissing" => false,
        "updateExisting" => true
      },
      "groups" => {
        "createMissing" => true,
        #"deleteMissing" => false,
        "updateExisting" => true
        # To avoid deleting pre-defined groups from zabbix, deleting groups
        # shall be implemented manually.
      },
      "templates" => {
        "createMissing" => true,
        #"deleteMissing" => false, 
        "updateExisting" => true
        # To avoid deleting pre-defined templates from zabbix, deleting templates
        # shall be implemented manually.
      },
      "applications" => {
        "createMissing" => true,
        #"deleteMissing" => false,
        "updateExisting" => true 
      },
      "items" => {
        "createMissing" => true,
        #"deleteMissing" => false,
        "updateExisting" => true
      },
      "templateLinkage" => {
        "createMissing" => true,
        #"deleteMissing" => false,
        "updateExisting" => true
      }
    },
    "source" => doc
  },
  "auth" => auth,
  "id" => rand(9999)
}

result = json_body(body)
puts result

date = Time.now.strftime('%Y-%m-%d')

# if log folder does not exist, create log folder
if File.directory?("xml") == false
  Dir.mkdir("xml")
end
# # Creating directory finish

File.open( "#{path}/xml/import.xml", 'a+' ) do |f|
  if result
    puts "All hostgroups/templates/applications/items have been import from ./xml/export.xml!"
    f.puts Time.now.strftime('%Y-%m-%d %H:%M:%S')
    f.puts "All hostgroups/templates/applications/items have been import from ./xml/export.xml!"
    f.puts result
  else
    f.puts Time.now.strftime('%Y-%m-%d %H:%M:%S')
    puts "import did not success!"
    f.puts "import did not success!"
    f.puts result
#=end
  end
end
