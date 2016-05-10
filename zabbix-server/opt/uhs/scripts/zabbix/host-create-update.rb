#!/opt/uhs/cots/ruby/bin/ruby
#-*- coding: UTF-8 -*-
$LOAD_PATH.unshift(File.dirname(__FILE__))
Dir.chdir("/srv/salt/zabbix/zabbix-server/opt/uhs/scripts/zabbix")
path = Dir.pwd
 
# change the path to current version folder
# create the log folder
#date = Time.now.strftime('%Y-%m-%d-%H-%M-%S')
date = Time.now.strftime('%Y-%m-%d')
path = Dir.pwd
if File.directory?("log") == false
  Dir.mkdir("log")
end
 
require "#{path}/conf/hostlist.rb"
require "#{path}/lib/json_body.rb"
require "#{path}/lib/get_auth.rb"
require "#{path}/bin/group_create.rb"
require "#{path}/bin/group_exists.rb"
require "#{path}/bin/temp_exists.rb"
require "#{path}/bin/host_exists.rb"
require "#{path}/bin/host_create.rb"
require "#{path}/bin/host_update.rb"
require "net/http"
require "json"
require "uri"

log_msg = Array.new
warning_msg = Array.new

i = 0
output_host_list = []
list = host_list

host_create_num = 0
host_update_num = 0
host_num = 0

basic_tmp_list = Hash.new
basic_tmp_list["temp"] = "Template Basic Information"
basic_tmp_list["auth"] = get_auth
basic_temp_id = temp_exists(basic_tmp_list)

list.each do |host|
  log_msg[i] = Array.new
  tmp_list = Hash.new
  tmp_list["auth"] = get_auth
  tmp_list["host"] = host["host"]
  tmp_list["ip"] = host["ip"]
  tmp_list["site_country"] = host["site_location"]
  tmp_list["type"] = host["deployment"]
  tmp_list["status"] = host["status"]
  tmp_list["templates"] = [{"templateid" => basic_temp_id}]
  tmp_list["groups"] = []
  roles = host["roles"]
  roles.each do |role|
    role_group_list = Hash.new
    role_group_list["auth"] = tmp_list["auth"]
    role_group_list["group"] = "#{role} Server"
    group_id = group_exists(role_group_list)
    if group_id == []
      group_id = group_create(role_group_list)
      tmp_list["groups"] += [{"groupid" => group_id}]
      puts "host group: #{role} Server, id: #{group_id}, has been created!"
      log_msg[i] += ["host group: #{role} Server, id: #{group_id}, has been created!"]
    else
      tmp_list["groups"] += [{"groupid" => group_id}]
    end
    role_group_list["temp"] = "Template #{role} Services"
    temp_id = temp_exists(role_group_list)
    if temp_id == []
       puts "Missing!!create Template #{role} Services first!!Missing"
       log_msg[i] += ["Missing!!Template #{role} Services is missing!!!Missing"]
       warning_msg += ["Template #{role} Services needs to be created!"]
    else
      tmp_list["templates"] += [{"templateid" => temp_id}]
    end
  end
  host_id = host_exists(tmp_list)
  if host_id == []
     host_id = host_create(tmp_list)
     tmp_list["hostid"] = host_id
     host_num += 1
     host_create_num += 1
     puts "host #{tmp_list["host"]}, id: #{tmp_list["hostid"]},  has been created!"
     log_msg[i] += ["host #{tmp_list["host"]}, id: #{tmp_list["hostid"]}, has been created!"] 
  else
    tmp_list["hostid"] = host_id
    host_id = host_update(tmp_list)
    tmp_list["hostid"] = host_id
    host_num += 1
    host_update_num += 1
    puts "host #{tmp_list["host"]}, id: #{tmp_list["hostid"]}, has been updated!"
    log_msg[i] += ["host #{tmp_list["host"]}, id: #{tmp_list["hostid"]}, has been updated!"] 
  end
  i += 1
  output_host_list += [tmp_list]
end

puts "Host amount: #{host_num}"
puts "Create #{host_create_num} host "
puts "Update #{host_update_num} host "
puts "---***---***--- Warning Message ---***---***---"

warning_msg.each do |msg|
  puts msg
end
 
File.open("#{path}/log/host-#{date}.log", "a+") do |f|
  f.puts "++++++++++++++++ modification record - #{date} ++++++++++++++++"
  log_msg.each do |a|
    a.each do |b|
      f.puts b
    end
  end
  # out_tmp_list.each do |a|
  #   f.puts a
  # end
  f.puts "Host amount: #{host_num}"
  f.puts "Create #{host_create_num} host "
  f.puts "Update #{host_update_num} host "
  f.puts "---***---***--- Warning Message ---***---***---"
  warning_msg.each do |msg|
    f.puts msg
  end
end
