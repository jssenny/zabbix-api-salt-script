#!/opt/uhs/cots/ruby/bin/ruby
#-*- coding: UTF-8 -*-
$LOAD_PATH.unshift(File.dirname(__FILE__))
Dir.chdir("/srv/salt/zabbix/generate")
path = Dir.pwd

require "#{path}/template/template-basic.rb"
require "#{path}/template/template-xtun.rb"
require "#{path}/template/xtun/app-xtun.rb"
require "#{path}/template/xtun/app-notifym.rb"
require "#{path}/template/xtun/app-notifyd.rb"
require "#{path}/template/xtun/app-webauth.rb"
# require "put the new file name here"

date = Time.new.strftime('%Y-%m-%d-%H-%M-%S')


tmp_list = []
tmp_list += template_basic
tmp_list += template_xtun
# tmp_list += new template

Dir.chdir("/srv/salt/zabbix/zabbix-server/opt/uhs/scripts/zabbix")
path = Dir.pwd

if File.directory?("conf") == false
  Dir.mkdir("conf")
end

length = tmp_list.length
f = File.new("#{path}/conf/template.rb", "w+")
f.puts "#!/opt/uhs/cots/ruby/bin/ruby\n"
f.puts "#-*- coding: UTF-8 -*-\n"
f.puts "# Created at #{date}\n"
f.puts "def groups()"
f.puts "  groups = ["
  tmp_list.each do |a|
    length -= 1
    if length >= 1 
      f.puts "    #{a},"
    else
      f.puts "    #{a}]\n"
    end
  end
#f.puts "  ]\n"
f.puts "  return groups"
f.puts "  end"
f.close

Dir.chdir("/srv/salt/zabbix/generate")
path = Dir.pwd

if File.directory?("backup") == false
  Dir.mkdir("conf")
end



length = tmp_list.length
f = File.new("#{path}/backup/template.rb-#{date}", "w+")
f.puts "#!/opt/uhs/cots/ruby/bin/ruby\n"
f.puts "#-*- coding: UTF-8 -*-\n"
f.puts "# Created at #{date}\n"
f.puts "def groups()"
f.puts "  groups = ["
  tmp_list.each do |a|
    length -= 1
    if length >= 1 
      f.puts "    #{a},"
    else
      f.puts "    #{a}]\n"
    end
  end
#f.puts "  ]\n"
f.puts "  return groups"
f.puts "  end"
f.close
