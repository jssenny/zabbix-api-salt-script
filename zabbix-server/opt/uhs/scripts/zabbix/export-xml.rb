#!/opt/uhs/cots/ruby/bin/ruby
#-*- coding: UTF-8 -*-
$LOAD_PATH.unshift(File.dirname(__FILE__))
Dir.chdir("/opt/ruby/scripts/zabbix/beta-2.0")
path = Dir.pwd

# change file location

#require "rubygems"
require "#{path}/lib/json_body.rb"
require "#{path}/lib/get_auth.rb"
require "#{path}/conf/template.rb"
require "#{path}/conf/hostlist.rb"
require "#{path}/bin/group_exists.rb"
require "#{path}/bin/temp_exists.rb"
require "#{path}/bin/host_exists.rb"
require "net/http"
require "json"
require "uri"

temp_list = groups
hostlist = host_list
group_ids = []
temp_ids =[]
host_ids =[]
auth = get_auth

temp_list.each do |group|
  tmp_list = {}
  tmp_list["group"] = group["group"]
  tmp_list["auth"] = auth
  temp_ids << group_exists(tmp_list)
  temps = group["temps"]
  temps.each do |temp|
    tmp_list["temp"] =  temp["temp"]
    temp_ids << temp_exists(tmp_list)
  end
end

hostlist.each do |host|
  tmp_list = {}
  tmp_list["auth"] = auth
  tmp_list["host"] = host["host"]
  host_ids << host_exists(tmp_list)
end

# get export result
auth = get_auth
body = {
  "jsonrpc" => "2.0",
  "method" => "configuration.export",
  "params" => {
    "options" => {
        "groups" => group_ids,
        "templates" => temp_ids,
        "hosts" => host_ids,
      },
    "format" => "xml"
  },
  "auth" => get_auth,
  "id" => rand(9999)
}

result = json_body(body)

date = Time.now.strftime('%Y-%m-%d')

# if log folder does not exist, create log folder
if File.directory?("xml") == false
  Dir.mkdir("xml")
end
# # Creating directory finish

if File.exists?("#{path}/xml/export.xml") == true
   mtime = File.mtime("#{path}/xml/export.xml")
   mtime = mtime.strftime('%Y-%m-%d-%H-%M-%S')
   File.rename("#{path}/xml/export.xml", "#{path}/xml/export-#{mtime}.xml")
end

File.open( "#{path}/xml/export.xml", 'w+' ) do |f|
  f.puts result
end

puts "All hostgroups/templates/applications/items/hosts have been exported to ./xml/export.xml!"



