#!/opt/uhs/cots/ruby/bin/ruby
#-*- coding: UTF-8 -*-
# Created at 2016-05-10-16-40-39
def groups()
  groups = [
    {"group"=>"UHS Template", "temps"=>[{"temp"=>"Template Basic Information", "apps"=>[{"app"=>"CPU", "items"=>[{"item"=>"CPU System Time", "key_"=>"system.cpu.util[,system]", "type"=>0, "value_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>60, "status"=>0}, {"item"=>"CPU User Time", "key_"=>"system.cpu.util[,user]", "type"=>0, "value_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>60, "status"=>0}, {"item"=>"webauth established redis connection numbers", "key_"=>"webauth.redis.connection", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}]}]}]},
    {"group"=>"UHS Template", "temps"=>[{"temp"=>"Template redis Services", "apps"=>[{"app"=>"redis info", "items"=>[{"item"=>"redis ping respone", "key_"=>"redis.cli.ping", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>60, "status"=>0}]}]}]}
]
 return groups
  end
