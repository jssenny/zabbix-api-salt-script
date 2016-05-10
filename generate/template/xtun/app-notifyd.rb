#!/opt/uhs/cots/ruby/bin/ruby
#-*- coding: UTF-8 -*-

def app_notifyd()
app_notifyd = [
  {
    "app" => "notifyd system resources",
    "items" => [
      {
        "item" => "notifyd parent process id",
        "key_" => "notifyd.parent.pid",
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
        "item" => "notifyd parent running ratio of cpu time",
        "key_" => "notifyd.parent.cpu.time",
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
        "item" => "notifyd parent process residing ratio in physical memory",
         "key_" => "notifyd.parent.mem.ratio",
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
         "item" => "notifyd parent process using virtual memory",
         "key_" => "notifyd.parent.virtual.mem",
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
         "item" => "notifyd parent process residing set size in non-swapped physical memory",
         "key_" => "notifyd.parent.resid.mem",
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
         "item" => "notifyd child process id",
         "key_" => "notifyd.child.pid",
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
         "item" => "notifyd child process running ratio of cpu time",
         "key_" => "notifyd.child.cpu.time",
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
         "item" => "notifyd child process residing ratio in physical memory",
         "key_" => "notifyd.child.mem.ratio",
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
         "item" => "notifyd child process using virtual memory",
         "key_" => "notifyd.child.virtual.mem",
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
         "item" => "notifyd child process residing set size in non-swapped physical memory",
         "key_" => "notifyd.child.resid.mem",
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
     "app" => "notifyd network status",
     "items" => [
       {
         "item" => "notifyd established connection numbers",
         "key_" => "notifyd.tcp.connection.num",
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
         "item" => "notifyd established postgres connection numbers",
         "key_" => "notifyd.postgres.connection",
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
         "item" => "notifyd apple push notification close_wait numbers",
         "key_" => "notifyd.apns.tcp.close.wait",
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
         "item" => "notifyd apple push notification tcp established numbers",
         "key_" => "notifyd.apns.tcp.connection",
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
         "item" => "notifyd established redis connection numbers",
         "key_" => "notifyd.redis.connection",
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
return app_notifyd
end
					
