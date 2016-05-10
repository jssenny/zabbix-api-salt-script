#!/opt/uhs/cots/ruby/bin/ruby
#-*- coding: UTF-8 -*-

def app_webauth()
app_webauth = [
  {
    "app" => "webauth system resources",
    "items" => [
      {
        "item" => "webauth parent process id",
        "key_" => "webauth.parent.pid",
        "type" => 0,
        "value_type" => 3,
        "data_type" => 0,
        "units" => "",
        "formula" => 1,
        "multiplier" => 0,
        "delay" => 30,
        "status" => 0
      },
      {
        "item" => "webauth parent running ratio of cpu time",
        "key_" => "webauth.parent.cpu.time",
        "type" => 0,
        "value_type" => 0,
        "data_type" => 0,
        "units" => "%",
        "formula" => 1,
        "multiplier" => 0,
        "delay" => 30,
        "status" => 0
      },
      {
        "item" => "webauth parent process residing ratio in physical memory",
         "key_" => "webauth.parent.mem.ratio",
         "type" => 0,
         "value_type" => 0,
         "data_type" => 0,
         "units" => "%",
         "formula" => 1,
         "multiplier" => 0,
         "delay" => 30,
         "status" => 0
       },
       {
         "item" => "webauth parent process using virtual memory",
         "key_" => "webauth.parent.virtual.mem",
         "type" => 0,
         "value_type" => 3,
         "data_type" => 0,
         "multiplier" => 1,
         "formula" => 1000,
         "units" => "B",
         "delay" => 30,
         "status" => 0
       },
       {
         "item" => "webauth parent process residing set size in non-swapped physical memory",
         "key_" => "webauth.parent.resid.mem",
         "type" => 0,
         "value_type" => 3,
         "data_type" => 0,
         "units" => "B",
         "formula" => 1000,
         "multiplier" => 1,
         "delay" => 30,
         "status" => 0
       },
       {
         "item" => "webauth child process id",
         "key_" => "webauth.child.pid",
         "type" => 0,
         "value_type" => 3,
         "data_type" => 0,
         "units" => "",
         "formula" => 1,
         "multiplier" => 0,
         "delay" => 30,
         "status" => 0
       },
       {
         "item" => "webauth child process running ratio of cpu time",
         "key_" => "webauth.child.cpu.time",
         "type" => 0,
         "value_type" => 3,
         "data_type" => 0,
         "units" => "%",
         "formula" => 1,
         "multiplier" => 0,
         "delay" => 30,
         "status" => 0
       },
       {
         "item" => "webauth child process residing ratio in physical memory",
         "key_" => "webauth.child.mem.ratio",
         "type" => 0,
         "value_type" => 0,
         "data_type" => 0,
         "units" => "%",
         "formula" => 1,
         "multiplier" => 0,
         "delay" => 30,
         "status" => 0
       },
       {
         "item" => "webauth child process using virtual memory",
         "key_" => "webauth.child.virtual.mem",
         "type" => 0,
         "value_type" => 3,
         "data_type" => 0,
         "units" => "B",
         "formula" => 1000,
         "multiplier" => 1,
         "delay" => 30,
         "status" => 0
       },
       {
         "item" => "webauth child process residing set size in non-swapped physical memory",
         "key_" => "webauth.child.resid.mem",
         "type" => 0,
         "value_type" => 3,
         "data_type" => 0,
         "units" => "B",
         "formula" => 1000,
         "multiplier" => 1,
         "delay" => 30,
         "status" => 0
       }
     ]
   },
   {
     "app" => "webauth network status",
     "items" => [
       {
         "item" => "webauth established connection numbers",
         "key_" => "webauth.tcp.connection.num",
         "type" => 0,
         "value_type" => 3,
         "data_type" => 0,
         "units" => "",
         "formula" => 1,
         "multiplier" => 0,
         "delay" => 30,
         "status" => 0
       }, 
       {
         "item" => "webauth established redis connection numbers",
         "key_" => "webauth.redis.connection",
         "type" => 0,
         "value_type" => 3,
         "data_type" => 0,
         "units" => "",
         "formula" => 1,
         "multiplier" => 0,
         "delay" => 30,
         "status" => 0
      }
    ]
  }    
] 
return app_webauth
end
					
