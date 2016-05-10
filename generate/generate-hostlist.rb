#!/opt/uhs/cots/ruby/bin/ruby
#-*- coding: UTF-8 -*-

# delete space and colon
def raw_operate(raw)
  raw.shift
  a_new = []
  raw.each do |r|
    r = r.delete ":"
    r = r.delete " " 
    #r = r.chomp
    a_new = a_new + ["#{r}"]
  end
  #puts a_new
  return a_new
end

# some grain items will return result with a dash('-') in the front of the string, we need to delete it.
# considering some hostnames may contain dash in the middle, so I define this individual method.
# This method will dump the first char in the string which will be a dash.

def del_dash(dashes)
  a = []
  dashes.each do |dash|
    a += ["#{dash[1..-1]}"]
  end
  #puts a
  return a
end

# The following are the main function script
# first check if the server is reachable.
# sort the result, remove colon and space, make the result into an array

salt_connect = %x(salt '*' test.ping).split("\n")
salt_con_new =[]
salt_connect.each do |host|
  host = host.delete ":"
  host = host.delete " "
  salt_con_new += ["#{host}"]
end

#puts salt_con_new

# make the result into a hash: "server id" => "test.ping result"
# sort the hosts, only the host with True result in 'test.ping' will 
# be used to create hostlist 

salt_connect_hash = {}
salt_connect_hash = Hash[*salt_con_new.flatten]

hostlist = []
hostlist_all = []
hostlist_not_used =[]
salt_connect_hash.each do |key, value|
  hostlist_all += ["#{key}"]
  if value == "True"
    hostlist += ["#{key}"]
  else
    hostlist_not_used += ["#{key}"]
  end
end

puts "The script has used salt commands to check  #{hostlist_all.length} hosts\n"

puts "The following hosts will be added into hostlist.rb\n"

puts hostlist

if hostlist_not_used.length > 0
  puts "Except the following #{hostlist_not_used.length} hosts which can not be reached in salt command. They are:\n"

  puts hostlist_not_used

  puts "Please check the connectivities between these hosts and salt-master.\n"
end
#puts hostlist


#This will be the hash which will finally be written into the hostlist file.

hash_return = []

hostlist.each do |host|
  element = {}
  ip_raw = %x(salt '#{host}' network.ip_addrs interface=eth0).split("\n")
  ip = raw_operate(ip_raw)
  ip = del_dash(ip)
  element["ip"] = ip[0] #currently we only pick up one interface
  element["host"] = host
  role_raw = %x(salt '#{host}' grains.get roles).split("\n")
  role = raw_operate(role_raw)
  role = del_dash(role)
  element["roles"] = role
  deploy_raw = %x(salt '#{host}' grains.get deployment).split("\n")
  deploy = raw_operate(deploy_raw)
  element["deployment"] = deploy[0] #currently element["deployment"] shall be a string, because current deployment will be either 'qa' or 'dv'.
  region_raw = %x(salt '#{host}' grains.get region).split("\n")
  region= raw_operate(region_raw)[1]
  element["status"] = 1
  hash_return += [element]
end

# puts hash_return

length = hash_return.length

# create hostlist

Dir.chdir("/srv/salt/zabbix/zabbix-server/opt/uhs/scripts/zabbix")
path = Dir.pwd
date = Time.new.strftime('%Y-%m-%d-%H-%M-%S')

if File.directory?("conf") == false
  Dir.mkdir("conf")
end

f = File.new("#{path}/conf/hostlist.rb", "w+")
f.puts "#!/opt/uhs/cots/ruby/bin/ruby\n"
f.puts "#-*- coding: UTF-8 -*-\n"
f.puts "# created at #{date}\n"
f.puts "def host_list()"
f.puts "  host_list = [\n"
  hash_return.each do |a|
    length -= 1
    if length >= 1
      f.puts "    #{a},"
      # puts "#{a}"
    else
      f.puts "    #{a}"
      # puts "#{a}"
    end
  end
f.puts "  ]\n"
f.puts "  return host_list"
f.puts "  end"
f.close

# puts hash_return
# puts host_list


# backup hostlist.rb with date tag

Dir.chdir("/srv/salt/zabbix/generate")
path = Dir.pwd

if File.directory?("backup") == false
  Dir.mkdir("backup")
end

length = hash_return.length

f = File.new("#{path}/backup/hostlist-#{date}.rb", "w+")
f.puts "#!/opt/uhs/cots/ruby/bin/ruby\n"
f.puts "#-*- coding: UTF-8 -*-\n"
f.puts "# created at #{date}\n"
f.puts "def host_list()"
f.puts "  host_list = [\n"
  hash_return.each do |b|
    length -= 1
    if length >= 1
      f.puts "    #{b},"
    else
      f.puts "    #{b}"
    end
  end
f.puts "  ]\n"
f.puts "  return host_list"
f.puts "  end"
f.close


