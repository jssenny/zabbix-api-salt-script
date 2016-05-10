#!/opt/uhs/cots/ruby/bin/ruby
#-*- coding: UTF-8 -*-

def template_basic()
template_basic = [
  {
    "group" => "UHS Template",
    "temps" => [
      {
        "temp" => "Template Basic Information",
        "apps" => [
          {
            "app" => "CPU",
            "items" => [
              {
                "item" => "CPU System Time",
                "key_" => "system.cpu.util[,system]",
                "type" => 0,
                "value_type" => 0,
                "units" => "%",
                "formula" => 1,
                "multiplier" => 0,
                "delay" => 60,
                "status" => 0
              },
              {
                "item" => "CPU User Time",
                "key_" => "system.cpu.util[,user]",
                "type" => 0,
                "value_type" => 0,
                "units" => "%",
                "formula" => 1,
                "multiplier" => 0,
                "delay" => 60,
                "status" => 0
              },
              {
                "item" => "CPU Steal Time",
                "key_" => "system.cpu.util[,steal]",
                "type" => 0,
                "value_type" => 0,
                "units" => "%",
                "formula" => 1,
                "multiplier" => 0,
                "delay" => 60,
                "status" => 0
              },
              {
                "item" => "CPU Nice Time",
                "key_" => "system.cpu.util[,nice]",
                "type" => 0,
                "value_type" => 0,
                "units" => "%",
                "formula" => 1,
                "multiplier" => 0,
                "delay" => 60,
                "status" => 0
              },
              {	
                "item" => "CPU Idle Time",
                "key_" => "system.cpu.util[,idle]",
                "type" => 0,
                "value_type" => 0,
                "units" => "%",
                "formula" => 1,
                "multiplier" => 0,
                "delay" => 60,
                "status" => 0
              },
              {
                "item" => "CPU Interrupt Time",
                "key_" => "system.cpu.util[,interrupt]",
                "type" => 0,
                "value_type" => 0,
                "units" => "%",
                "formula" => 1,
                "multiplier" => 0,
                "delay" => 60,
                "status" => 0
              },
              {
                "item" => "CPU Softirq Time",
                "key_" => "system.cpu.util[,softirq]",
                "type" => 0,
                "value_type" => 0,
                "units" => "%",
                "formula" => 1,
                "multiplier" => 0,
                "delay" => 60,
                "status" => 0
              },
              {
                "item" => "CPU IOWait Time",
                "key_" => "system.cpu.util[,iowait]",
                "type" => 0,
                "value_type" => 0,
                "units" => "%",
                "formula" => 1,
                "multiplier" => 0,
                "delay" => 60,
                "status" => 0
              }
            ]
          },
          {
            "app" => "File",
            "items" => [
              {
                "item" => "Free Swap Space",
                "key_" => "system.swap.size[,free]",
                "type" => 0,
                "value_type" => 3,
                "data_type" => 0,
                "units" => "B",
                "formula" => 1,
                "multiplier" => 0,
                "delay" => 60,
                "status" => 0
              },
              {
                "item" => "Free Swap Space in %",
                "key_" => "system.swap.size[,pfree]",
                "type" => 0,
                "value_type" => 0,
                "units" => "%",
                "formula" => 1,
                "multiplier" => 0,
                "delay" => 60,
                "status" => 0
              }
            ]
          },
          {
            "app" => "Memory",
            "items" => [
              {
                "item" => "Available Memory",
                "key_" => "vm.memory.size[available]",
                "type" => 0,
                "value_type" => 3,
                "data_type" => 0,
                "units" => "B",
                "formula" => 1,
                "multiplier" => 0,
                "delay" => 60,
                "status" => 0
              },
              {
                "item" => "Total Memory",
                "key_" => "vm.memory.size[total]",
                "type" => 0,
                "value_type" => 3,
                "data_type" => 0,
                "units" => "B",
                "formula" => 1,
                "multiplier" => 0,
                "delay" => 60,
                "status" => 0
              },
              {
                "item" => "Total Swap Space",
                "key_" => "system.swap.size[,total]",
                "type" => 0,
                "value_type" => 3,
                "data_type" => 0,
                "units" => "B",
                "formula" => 1,
                "multiplier" => 0,
                "delay" => 60,
                "status" => 0
              }
            ]
          },
          {
            "app" => "General",
            "items" => [
              {
                "item" => "Host Boot Time",
                "key_" => "system.boottime",
                "type" => 0,
                "value_type" => 3,
                "data_type" => 0,
                "units" => "unixtime",
                "formula" => 1,
                "multiplier" => 0,
                "delay" => 60,
                "status" => 0
              },
              {
                "item" => "Host Local Time",
                "key_" => "system.localtime",
                "type" => 0,
                "value_type" => 3,
                "data_type" => 0,
                "formula" => 1,
                "multiplier" => 0,
                "units" => "unixtime",
                "delay" => 60,
                "status" => 0
              },
              {
                "item" => "System Uname",
                "key_" => "system.uname",
                "type" => 0,
                "value_type" => 1,
                "delay" => 60,
                "status" => 0
              },
              {
                "item" => "System uptime",
                "key_" => "system.uptime",
                "type" => 0,
                "value_type" => 3,
                "data_type" => 0,
                "units" => 'uptime',
                "formula" => 1,
                "multiplier" => 0,
                "delay" => 60,
                "status" => 0
              },
              {
                "item" => "Host name",
                "key_" => "system.hostname",
                "type" => 0,
                "value_type" => 1,
                "delay" => 60,
                "status" => 0
              }
            ]
          },
          {
            "app" => "Processes",
            "items" => [
              {
                "item" => "Process Numbers",
                "key_" => "proc.num[]",
                "type" => 0,
                "value_type" => 3,
                "data_type" => 0,
                "units"  => "",
                "formula" => 1,
                "multiplier" => 0,
                "delay" => 60,
                "status" => 0
              },
              {
                "item" => "Running Process Numbers",
                "key_" => "proc.num[,,run]",
                "type" => 0,
                "value_type" => 0,
                "units"  => "",
                "formula" => 1,
                "multiplier" => 0,
                "delay" => 60,
                "status" => 0
              }
            ]
          },
          {
            "app" => "SSH",
            "items" => [
              {
                "item" => "SSH session number",
                "key_" => "ssh.session.num",
                "type" => 0,
                "value_type" => 3,
                "data_type" => 0,
                "units" => "",
                "formula" => 1,
                "multiplier" => 0,
                "delay" => 60,
                "status" => 0
              }
            ]
          }
        ]
      }
    ]
  }
]

return template_basic
end
				
