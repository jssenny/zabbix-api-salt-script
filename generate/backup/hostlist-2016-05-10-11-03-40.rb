#!/opt/uhs/cots/ruby/bin/ruby
#-*- coding: UTF-8 -*-
# created at 2016-05-10-11-03-40
def host_list()
  host_list = [
    {"ip"=>"192.168.110.207", "host"=>"zabbix-server", "roles"=>["zabbix-server", "csgw"], "deployment"=>"vm", "status"=>1},
    {"ip"=>"192.168.110.210", "host"=>"test-01", "roles"=>["test"], "deployment"=>"test", "status"=>1}
  ]
  return host_list
  end
