#!/opt/uhs/cots/ruby/bin/ruby
#-*- coding: UTF-8 -*-

def app_notifym()
app_notifym = [
  {
    "app" => "notifym system resources",
    "items" => [
      {
        "item" => "notifym parent process id",
        "key_" => "notifym.parent.pid",
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
        "item" => "notifym parent running ratio of cpu time",
        "key_" => "notifym.parent.cpu.time",
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
        "item" => "notifym parent process residing ratio in physical memory",
         "key_" => "notifym.parent.mem.ratio",
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
         "item" => "notifym parent process using virtual memory",
         "key_" => "notifym.parent.virtual.mem",
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
         "item" => "notifym parent process residing set size in non-swapped physical memory",
         "key_" => "notifym.parent.resid.mem",
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
         "item" => "notifym child process id",
         "key_" => "notifym.child.pid",
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
         "item" => "notifym child process running ratio of cpu time",
         "key_" => "notifym.child.cpu.time",
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
         "item" => "notifym child process residing ratio in physical memory",
         "key_" => "notifym.child.mem.ratio",
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
         "item" => "notifym child process using virtual memory",
         "key_" => "notifym.child.virtual.mem",
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
         "item" => "notifym child process residing set size in non-swapped physical memory",
         "key_" => "notifym.child.resid.mem",
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
     "app" => "notifym network status",
     "items" => [
       {
         "item" => "notifym established connection numbers",
         "key_" => "notifym.tcp.connection.num",
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
         "item" => "notifym established postgres connection numbers",
         "key_" => "notifym.postgres.connection",
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
         "item" => "notifym apple push notification close_wait numbers",
         "key_" => "notifym.apns.tcp.close.wait",
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
         "item" => "notifym apple push notification tcp established numbers",
         "key_" => "notifym.apns.tcp.connection",
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
         "item" => "notifym established redis connection numbers",
         "key_" => "notifym.redis.connection",
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
return app_notifym
end
					
