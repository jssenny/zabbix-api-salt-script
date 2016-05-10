#!/usr/local/rvm/rubies/ruby-1.9.3-p551/bin/ruby
#-*- coding: UTF-8 -*-
def host_list()
host_list = [
#{"ip"=>"172.29.13.31", "host"=>"pg-qa1a", "roles"=>["pg"], "deployment"=>"qa", "status"=>1},
#{"ip"=>"172.29.23.11", "host"=>"redis-qa1b", "roles"=>["redis"], "deployment"=>"qa", "status"=>1},
#{"ip"=>"172.29.13.12", "host"=>"redis-qa2a", "roles"=>["redis"], "deployment"=>"qa", "status"=>1},
#{"ip"=>"172.29.13.13", "host"=>"redis-qa3a", "roles"=>["redis"], "deployment"=>"qa", "status"=>1},
#{"ip"=>"172.29.15.101", "host"=>"cproxy-qa1a", "roles"=>["cproxy"], "deployment"=>"qa", "status"=>1},
#{"ip"=>"172.29.23.12", "host"=>"redis-qa2b", "roles"=>["redis"], "deployment"=>"qa", "status"=>1},
#{"ip"=>"172.29.24.11", "host"=>"vpn-qa1b", "roles"=>["vpn", "region-vpn-server"], "deployment"=>"qa", "status"=>1},
#{"ip"=>"172.29.13.11", "host"=>"redis-qa1a", "roles"=>["redis"], "deployment"=>"qa", "status"=>1},
{"ip"=>"172.29.23.13", "host"=>"redis-qa3b", "roles"=>["redis"], "deployment"=>"qa", "status"=>1},
#{"ip"=>"172.29.15.102", "host"=>"cproxy-qa2a", "roles"=>["cproxy"], "deployment"=>"qa", "status"=>1},
{"ip"=>"172.29.11.11", "host"=>"csgw-qa1a", "roles"=>["csgw"], "deployment"=>"qa", "status"=>1},
{"ip"=>"172.29.16.5", "host"=>"netmon-qa1a", "roles"=>["netmon"], "deployment"=>"qa", "status"=>1},
#{"ip"=>"172.29.14.11", "host"=>"vpn-qa1a", "roles"=>["vpn", "region-vpn-server"], "deployment"=>"qa", "status"=>1},
#{"ip"=>"172.29.1.5", "host"=>"xrelay-dv1a", "roles"=>["xtun", "csgw", "cproxy"], "deployment"=>"dv", "status"=>1},
#{"ip"=>"172.29.25.102", "host"=>"cproxy-qa2b", "roles"=>["cproxy"], "deployment"=>"qa", "status"=>1},
#{"ip"=>"172.29.11.12", "host"=>"csgw-qa2a", "roles"=>["csgw"], "deployment"=>"qa", "status"=>1},
#{"ip"=>"172.29.23.31", "host"=>"pg-qa1b", "roles"=>["pg"], "deployment"=>"qa", "status"=>1},
{"ip"=>"172.29.15.11", "host"=>"xtun-qa1a", "roles"=>["xtun"], "deployment"=>"qa", "status"=>1},
#{"ip"=>"172.29.2.5", "host"=>"xrelay-dv2b", "roles"=>["xtun", "csgw", "cproxy"], "deployment"=>"dv", "status"=>1},
{"ip"=>"172.29.25.12", "host"=>"xtun-qa2b", "roles"=>["xtun"], "deployment"=>"qa", "status"=>1},
{"ip"=>"172.29.21.11", "host"=>"csgw-qa1b", "roles"=>["csgw"], "deployment"=>"qa", "status"=>1},
#{"ip"=>"172.28.14.11", "host"=>"vpn-qu1a", "roles"=>["region-vpn-client"], "deployment"=>"qa", "status"=>1},
#{"ip"=>"172.28.24.11", "host"=>"vpn-qu1b", "roles"=>["region-vpn-client"], "deployment"=>"qa", "status"=>1},
#{"ip"=>"172.28.15.11", "host"=>"xtun-qu1a", "roles"=>["xtun"], "deployment"=>"qa", "status"=>1},
#{"ip"=>"172.28.25.11", "host"=>"xtun-qu2b", "roles"=>["xtun"], "deployment"=>"qa", "status"=>1},
#{"ip"=>"172.28.15.102", "host"=>"cproxy-qu2a", "roles"=>["cproxy"], "deployment"=>"qa", "status"=>1},
#{"ip"=>"172.28.25.102", "host"=>"cproxy-qu2b", "roles"=>["cproxy"], "deployment"=>"qa", "status"=>1}
]
return host_list
end
