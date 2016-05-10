#!/opt/uhs/cots/ruby/bin/ruby
#-*- coding: UTF-8 -*-

def app_xtun()
app_xtun = [
  {
    "app" => "xtun system resources",
    "items" => [
      {
        "item" => "xtun parent process id",
        "key_" => "xtun.parent.pid",
        "type" => 0,
        "value_type" => 3,
        "data_type" => 0,
        "units" => "",
        "formula" => 1,
        "multiplier" => 0,
        "delay" => 600,
        "status" => 0
      },
      {
        "item" => "xtun parent process running ratio of cpu time",
        "key_" => "xtun.parent.cpu.time",
        "type" => 0,
        "value_type" => 0,
        "units" => "%",
        "formula" => 1,
        "multiplier" => 0,
        "delay" => 30,
        "status" => 0
      },
      {
        "item" => "xtun parent process residing ratio in physical memory",
        "key_" => "xtun.parent.mem.ratio",
        "type" => 0,
        "value_type" => 0,
        "units" => "%",
        "formula" => 1,
        "multiplier" => 0,
        "delay" => 30,
        "status" => 0
      },
      {
        "item" => "xtun parent process using virtual memory",
        "key_" => "xtun.parent.virtual.mem",
        "type" => 0,
        "value_type" => 3,
        "data_type" => 0,
        "formula" => 1000,
        "multiplier" => 1,
        "units" => "B",
        "delay" => 30,
        "status" => 0
      },
      {
        "item" => "xtun parent process residing set size in non-swapped physical memory",
        "key_" => "xtun.parent.resid.mem",
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
        "item" => "xtun child process id",
        "key_" => "xtun.child.pid",
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
        "item" => "xtun child process running ratio of cpu time",
        "key_" => "xtun.child.cpu.time",
        "type" => 0,
        "value_type" => 0,
        "units" => "%",
        "formula" => 1,
        "multiplier" => 0,
        "delay" => 30,
        "status" => 0
      },
      {
        "item" => "xtun child process residing ratio in physical memory",
        "key_" => "xtun.child.mem.ratio",
        "type" => 0,
        "value_type" => 0,
        "units" => "%",
        "formula" => 1,
        "multiplier" => 0, 
        "delay" => 30,
        "status" => 0
      },
      {
        "item" => "xtun child process using virtual memory",
        "key_" => "xtun.child.virtual.mem",
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
        "item" => "xtun child process residing set size in non-swapped physical memory",
        "key_" => "xtun.child.resid.mem",
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
    "app" => "xtun network status",
    "items" => [
      {
        "item" => "xtun child process: established connection numbers",
        "key_" => "xtun.tcp.connection.num",
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
        "item" => "xtun child process: established device wireless connection numbers",
        "key_" => "xtun.tcp.connection.wireless",
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
        "item" => "xtun child process: established device wireline connection numbers",
        "key_" => "xtun.tcp.connection.wireline",
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
        "item" => "xtun child process: established redis connection numbers",
        "key_" => "xtun.redis.connection",
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

return app_xtun
end
					
