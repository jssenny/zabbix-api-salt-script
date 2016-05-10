#!/opt/uhs/cots/ruby/bin/ruby
#-*- coding: UTF-8 -*-
$LOAD_PATH.unshift(File.dirname(__FILE__))
Dir.chdir("/opt/uhs/scripts/zabbix")
path = Dir.pwd
 
# change the path to current version folder
# create the log folder
#date = Time.now.strftime('%Y-%m-%d-%H-%M-%S')
date = Time.now.strftime('%Y-%m-%d')
path = Dir.pwd
if File.directory?("log") == false
  Dir.mkdir("log")
end
 
require "#{path}/conf/template.rb"
require "#{path}/lib/json_body.rb"
require "#{path}/lib/get_auth.rb"
require "#{path}/bin/group_create.rb"
require "#{path}/bin/group_exists.rb"
require "#{path}/bin/temp_create.rb"
require "#{path}/bin/temp_exists.rb"
require "#{path}/bin/app_exists.rb"
require "#{path}/bin/app_create.rb"
require "#{path}/bin/item_create.rb"
require "#{path}/bin/item_exists.rb"
require "#{path}/bin/group_update.rb"
require "#{path}/bin/temp_update.rb"
require "#{path}/bin/app_update.rb"
require "#{path}/bin/item_update.rb"
require "net/http"
require "json"
require "uri"

# the script will check if the group/template/application/item exist.
# conf/template.rb will be the input to the script.
# the script has been tested and debugged, if no mistake 
# in conf/template.rb, all the actions in this script will be 
# successful. Therefore there will be no error check in this script.

out_tmp_list = []
log_msg = []
list = groups
group_create_num = 0
group_update_num = 0
group_num = 0
temp_create_num = 0
temp_update_num = 0
temp_num = 0 
app_create_num = 0
app_update_num = 0
app_num = 0
item_create_num = 0
item_update_num = 0
item_num = 0


list.each do |group|
  tmp_list = Hash.new
  tmp_list["auth"] = get_auth
  
  # create group
  tmp_list["group"] = group["group"]
  group_id = group_exists(tmp_list)

  # if group doesn't exist, create the group,
  if group_id == []
    # puts tmp_list
    group_id = group_create(tmp_list)
    tmp_list["groupid"] = group_id
    group_create_num += 1
    group_num += 1
    puts "group name: #{tmp_list["group"]}, id: #{tmp_list["groupid"]} has been created"
    log_msg += ["group name: #{tmp_list["group"]}, id: #{tmp_list["groupid"]} has been created"]
  else
    tmp_list["groupid"] = group_id
    group_id = group_update(tmp_list)
    tmp_list["groupid"] = group_id
    group_num += 1
    group_update_num += 1
    puts "name: #{tmp_list["group"]}, id: #{tmp_list["groupid"]} has been updated"
    log_msg += ["name: #{tmp_list["group"]}, id: #{tmp_list["groupid"]} has been updated"]
  end

  # create template
  temps = group["temps"]
  temps.each do |temp|
    tmp_list["temp"] = temp["temp"]
    temp_id = temp_exists(tmp_list)
    
    if temp_id == []
      # puts tmp_list
      temp_id = temp_create(tmp_list)    
      tmp_list["tempid"] = temp_id
      temp_num += 1
      temp_create_num += 1
      puts "template name: #{tmp_list["temp"]}, id: #{tmp_list["tempid"]} has been created"
      log_msg += ["template name: #{tmp_list["temp"]}, id: #{tmp_list["tempid"]} has been created"]
    else
      tmp_list["tempid"] = temp_id
      temp_id = temp_update(tmp_list)
      tmp_list["tempid"] = temp_id
      temp_num += 1
      temp_update_num += 1
      puts "template name: #{tmp_list["temp"]}, id: #{tmp_list["tempid"]} has been updated"
      log_msg += ["template name: #{tmp_list["temp"]}, id: #{tmp_list["tempid"]} has been updated"]
    end
    
    # create application
    apps = temp["apps"]
    apps.each do |app|
      tmp_list["app"] = app["app"]
      app_id = app_exists(tmp_list)
     
      if app_id == []
        # puts tmp_list
        app_id = app_create(tmp_list)
        tmp_list["appid"] = app_id
        app_num += 1
        app_create_num += 1
        puts "application name: #{tmp_list["app"]}, id: #{tmp_list["appid"]} has been created"
        log_msg += ["application name: #{tmp_list["app"]}, id: #{tmp_list["appid"]} has been created"]
      else
        # puts tmp_list
        tmp_list["appid"] = app_id
        app_id = app_update(tmp_list)
        tmp_list["appid"] = app_id
        app_num += 1
        app_update_num += 1
        puts "application name: #{tmp_list["app"]}, id: #{tmp_list["appid"]} has been updated"
        log_msg += ["application name: #{tmp_list["app"]}, id: #{tmp_list["appid"]} has been updated"]

       end
    # create item 
      items = app["items"]
      items.each do |item|
        tmp_list = tmp_list.merge(item)
        item_id = item_exists(tmp_list)
        
        if item_id == []
          # puts tmp_list
          item_id = item_create(tmp_list)    
          tmp_list["itemid"] = item_id
          item_num += 1
          item_create_num += 1
          puts "item name: #{tmp_list["item"]}, id: #{tmp_list["itemid"]} has been created"
          log_msg += ["item name: #{tmp_list["item"]}, id: #{tmp_list["itemid"]} has been created"]
        else
          # puts tmp_list
          tmp_list["itemid"] = item_id
          item_id = item_update(tmp_list)    
          tmp_list["itemid"] = item_id
          item_num += 1
          item_update_num += 1
          puts "item name: #{tmp_list["item"]}, id: #{tmp_list["itemid"]} has been updated"
          log_msg += ["item name: #{tmp_list["item"]}, id: #{tmp_list["itemid"]} has been updated"]
        end
        out_tmp_list += [tmp_list]
      end
    end
  end
end

puts "Host group amount: #{group_num}"
puts "Create #{group_create_num} host group"
puts "Update #{group_update_num} host group"
puts "template amount: #{temp_num}"
puts "Create #{temp_create_num} template"
puts "Update #{temp_update_num} template"
puts "application number: #{app_num}"
puts "Create #{app_create_num} application"
puts "Update #{app_update_num} application"
puts "item number: #{item_num}"
puts "Create #{item_create_num} item"
puts "Update #{item_update_num} item"
 
File.open("#{path}/log/template-#{date}.log", "a+") do |f|
  f.puts "++++++++++++++++ modification record - #{date} ++++++++++++++++"
  log_msg.each do |a|
    f.puts a
  end
  # out_tmp_list.each do |a|
  #   f.puts a
  # end
  f.puts "Host group amount: #{group_num}"
  f.puts "Create #{group_create_num} host group"
  f.puts "Update #{group_update_num} host group"
  f.puts "template amount: #{temp_num}"
  f.puts "Create #{temp_create_num} template"
  f.puts "Update #{temp_update_num} template"
  f.puts "application number: #{app_num}"
  f.puts "Create #{app_create_num} application"
  f.puts "Update #{app_update_num} application"
  f.puts "item number: #{item_num}"
  f.puts "Create #{item_create_num} item"
  f.puts "Update #{item_update_num} item"
end
