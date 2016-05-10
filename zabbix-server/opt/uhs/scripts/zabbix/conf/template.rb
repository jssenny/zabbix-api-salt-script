#!/opt/uhs/cots/ruby/bin/ruby
#-*- coding: UTF-8 -*-
# Created at 2016-05-10-11-28-30
def groups()
  groups = [
    {"group"=>"UHS Template", "temps"=>[{"temp"=>"Template Basic Information", "apps"=>[{"app"=>"CPU", "items"=>[{"item"=>"CPU System Time", "key_"=>"system.cpu.util[,system]", "type"=>0, "value_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>60, "status"=>0}, {"item"=>"CPU User Time", "key_"=>"system.cpu.util[,user]", "type"=>0, "value_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>60, "status"=>0}, {"item"=>"CPU Steal Time", "key_"=>"system.cpu.util[,steal]", "type"=>0, "value_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>60, "status"=>0}, {"item"=>"CPU Nice Time", "key_"=>"system.cpu.util[,nice]", "type"=>0, "value_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>60, "status"=>0}, {"item"=>"CPU Idle Time", "key_"=>"system.cpu.util[,idle]", "type"=>0, "value_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>60, "status"=>0}, {"item"=>"CPU Interrupt Time", "key_"=>"system.cpu.util[,interrupt]", "type"=>0, "value_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>60, "status"=>0}, {"item"=>"CPU Softirq Time", "key_"=>"system.cpu.util[,softirq]", "type"=>0, "value_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>60, "status"=>0}, {"item"=>"CPU IOWait Time", "key_"=>"system.cpu.util[,iowait]", "type"=>0, "value_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>60, "status"=>0}]}, {"app"=>"File", "items"=>[{"item"=>"Free Swap Space", "key_"=>"system.swap.size[,free]", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"B", "formula"=>1, "multiplier"=>0, "delay"=>60, "status"=>0}, {"item"=>"Free Swap Space in %", "key_"=>"system.swap.size[,pfree]", "type"=>0, "value_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>60, "status"=>0}]}, {"app"=>"Memory", "items"=>[{"item"=>"Available Memory", "key_"=>"vm.memory.size[available]", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"B", "formula"=>1, "multiplier"=>0, "delay"=>60, "status"=>0}, {"item"=>"Total Memory", "key_"=>"vm.memory.size[total]", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"B", "formula"=>1, "multiplier"=>0, "delay"=>60, "status"=>0}, {"item"=>"Total Swap Space", "key_"=>"system.swap.size[,total]", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"B", "formula"=>1, "multiplier"=>0, "delay"=>60, "status"=>0}]}, {"app"=>"General", "items"=>[{"item"=>"Host Boot Time", "key_"=>"system.boottime", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"unixtime", "formula"=>1, "multiplier"=>0, "delay"=>60, "status"=>0}, {"item"=>"Host Local Time", "key_"=>"system.localtime", "type"=>0, "value_type"=>3, "data_type"=>0, "formula"=>1, "multiplier"=>0, "units"=>"unixtime", "delay"=>60, "status"=>0}, {"item"=>"System Uname", "key_"=>"system.uname", "type"=>0, "value_type"=>1, "delay"=>60, "status"=>0}, {"item"=>"System uptime", "key_"=>"system.uptime", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"uptime", "formula"=>1, "multiplier"=>0, "delay"=>60, "status"=>0}, {"item"=>"Host name", "key_"=>"system.hostname", "type"=>0, "value_type"=>1, "delay"=>60, "status"=>0}]}, {"app"=>"Processes", "items"=>[{"item"=>"Process Numbers", "key_"=>"proc.num[]", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>60, "status"=>0}, {"item"=>"Running Process Numbers", "key_"=>"proc.num[,,run]", "type"=>0, "value_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>60, "status"=>0}]}, {"app"=>"SSH", "items"=>[{"item"=>"SSH session number", "key_"=>"ssh.session.num", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>60, "status"=>0}]}]}]},
    {"group"=>"UHS Template", "temps"=>[{"temp"=>"Template xtun Services", "apps"=>[{"app"=>"xtun system resources", "items"=>[{"item"=>"xtun parent process id", "key_"=>"xtun.parent.pid", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>600, "status"=>0}, {"item"=>"xtun parent process running ratio of cpu time", "key_"=>"xtun.parent.cpu.time", "type"=>0, "value_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"xtun parent process residing ratio in physical memory", "key_"=>"xtun.parent.mem.ratio", "type"=>0, "value_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"xtun parent process using virtual memory", "key_"=>"xtun.parent.virtual.mem", "type"=>0, "value_type"=>3, "data_type"=>0, "formula"=>1000, "multiplier"=>1, "units"=>"B", "delay"=>30, "status"=>0}, {"item"=>"xtun parent process residing set size in non-swapped physical memory", "key_"=>"xtun.parent.resid.mem", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"B", "formula"=>1000, "multiplier"=>1, "delay"=>30, "status"=>0}, {"item"=>"xtun child process id", "key_"=>"xtun.child.pid", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"xtun child process running ratio of cpu time", "key_"=>"xtun.child.cpu.time", "type"=>0, "value_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"xtun child process residing ratio in physical memory", "key_"=>"xtun.child.mem.ratio", "type"=>0, "value_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"xtun child process using virtual memory", "key_"=>"xtun.child.virtual.mem", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"B", "formula"=>1000, "multiplier"=>1, "delay"=>30, "status"=>0}, {"item"=>"xtun child process residing set size in non-swapped physical memory", "key_"=>"xtun.child.resid.mem", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"B", "formula"=>1000, "multiplier"=>1, "delay"=>30, "status"=>0}]}, {"app"=>"xtun network status", "items"=>[{"item"=>"xtun child process: established connection numbers", "key_"=>"xtun.tcp.connection.num", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"xtun child process: established device wireless connection numbers", "key_"=>"xtun.tcp.connection.wireless", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"xtun child process: established device wireline connection numbers", "key_"=>"xtun.tcp.connection.wireline", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"xtun child process: established redis connection numbers", "key_"=>"xtun.redis.connection", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}]}, {"app"=>"notifym system resources", "items"=>[{"item"=>"notifym parent process id", "key_"=>"notifym.parent.pid", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"notifym parent running ratio of cpu time", "key_"=>"notifym.parent.cpu.time", "type"=>0, "value_type"=>0, "data_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"notifym parent process residing ratio in physical memory", "key_"=>"notifym.parent.mem.ratio", "type"=>0, "value_type"=>0, "data_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"notifym parent process using virtual memory", "key_"=>"notifym.parent.virtual.mem", "type"=>0, "value_type"=>3, "data_type"=>0, "multiplier"=>1, "formula"=>1000, "units"=>"B", "delay"=>30, "status"=>0}, {"item"=>"notifym parent process residing set size in non-swapped physical memory", "key_"=>"notifym.parent.resid.mem", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"B", "formula"=>1000, "multiplier"=>1, "delay"=>30, "status"=>0}, {"item"=>"notifym child process id", "key_"=>"notifym.child.pid", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"notifym child process running ratio of cpu time", "key_"=>"notifym.child.cpu.time", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"notifym child process residing ratio in physical memory", "key_"=>"notifym.child.mem.ratio", "type"=>0, "value_type"=>0, "data_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"notifym child process using virtual memory", "key_"=>"notifym.child.virtual.mem", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"B", "formula"=>1000, "multiplier"=>1, "delay"=>30, "status"=>0}, {"item"=>"notifym child process residing set size in non-swapped physical memory", "key_"=>"notifym.child.resid.mem", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"B", "formula"=>1000, "multiplier"=>1, "delay"=>30, "status"=>0}]}, {"app"=>"notifym network status", "items"=>[{"item"=>"notifym established connection numbers", "key_"=>"notifym.tcp.connection.num", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"notifym established postgres connection numbers", "key_"=>"notifym.postgres.connection", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"notifym apple push notification close_wait numbers", "key_"=>"notifym.apns.tcp.close.wait", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"notifym apple push notification tcp established numbers", "key_"=>"notifym.apns.tcp.connection", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"notifym established redis connection numbers", "key_"=>"notifym.redis.connection", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}]}, {"app"=>"notifyd system resources", "items"=>[{"item"=>"notifyd parent process id", "key_"=>"notifyd.parent.pid", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"notifyd parent running ratio of cpu time", "key_"=>"notifyd.parent.cpu.time", "type"=>0, "value_type"=>0, "data_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"notifyd parent process residing ratio in physical memory", "key_"=>"notifyd.parent.mem.ratio", "type"=>0, "value_type"=>0, "data_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"notifyd parent process using virtual memory", "key_"=>"notifyd.parent.virtual.mem", "type"=>0, "value_type"=>3, "data_type"=>0, "multiplier"=>1, "formula"=>1000, "units"=>"B", "delay"=>30, "status"=>0}, {"item"=>"notifyd parent process residing set size in non-swapped physical memory", "key_"=>"notifyd.parent.resid.mem", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"B", "formula"=>1000, "multiplier"=>1, "delay"=>30, "status"=>0}, {"item"=>"notifyd child process id", "key_"=>"notifyd.child.pid", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"notifyd child process running ratio of cpu time", "key_"=>"notifyd.child.cpu.time", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"notifyd child process residing ratio in physical memory", "key_"=>"notifyd.child.mem.ratio", "type"=>0, "value_type"=>0, "data_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"notifyd child process using virtual memory", "key_"=>"notifyd.child.virtual.mem", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"B", "formula"=>1000, "multiplier"=>1, "delay"=>30, "status"=>0}, {"item"=>"notifyd child process residing set size in non-swapped physical memory", "key_"=>"notifyd.child.resid.mem", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"B", "formula"=>1000, "multiplier"=>1, "delay"=>30, "status"=>0}]}, {"app"=>"notifyd network status", "items"=>[{"item"=>"notifyd established connection numbers", "key_"=>"notifyd.tcp.connection.num", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"notifyd established postgres connection numbers", "key_"=>"notifyd.postgres.connection", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"notifyd apple push notification close_wait numbers", "key_"=>"notifyd.apns.tcp.close.wait", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"notifyd apple push notification tcp established numbers", "key_"=>"notifyd.apns.tcp.connection", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"notifyd established redis connection numbers", "key_"=>"notifyd.redis.connection", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}]}, {"app"=>"webauth system resources", "items"=>[{"item"=>"webauth parent process id", "key_"=>"webauth.parent.pid", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"webauth parent running ratio of cpu time", "key_"=>"webauth.parent.cpu.time", "type"=>0, "value_type"=>0, "data_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"webauth parent process residing ratio in physical memory", "key_"=>"webauth.parent.mem.ratio", "type"=>0, "value_type"=>0, "data_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"webauth parent process using virtual memory", "key_"=>"webauth.parent.virtual.mem", "type"=>0, "value_type"=>3, "data_type"=>0, "multiplier"=>1, "formula"=>1000, "units"=>"B", "delay"=>30, "status"=>0}, {"item"=>"webauth parent process residing set size in non-swapped physical memory", "key_"=>"webauth.parent.resid.mem", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"B", "formula"=>1000, "multiplier"=>1, "delay"=>30, "status"=>0}, {"item"=>"webauth child process id", "key_"=>"webauth.child.pid", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"webauth child process running ratio of cpu time", "key_"=>"webauth.child.cpu.time", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"webauth child process residing ratio in physical memory", "key_"=>"webauth.child.mem.ratio", "type"=>0, "value_type"=>0, "data_type"=>0, "units"=>"%", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"webauth child process using virtual memory", "key_"=>"webauth.child.virtual.mem", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"B", "formula"=>1000, "multiplier"=>1, "delay"=>30, "status"=>0}, {"item"=>"webauth child process residing set size in non-swapped physical memory", "key_"=>"webauth.child.resid.mem", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"B", "formula"=>1000, "multiplier"=>1, "delay"=>30, "status"=>0}]}, {"app"=>"webauth network status", "items"=>[{"item"=>"webauth established connection numbers", "key_"=>"webauth.tcp.connection.num", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}, {"item"=>"webauth established redis connection numbers", "key_"=>"webauth.redis.connection", "type"=>0, "value_type"=>3, "data_type"=>0, "units"=>"", "formula"=>1, "multiplier"=>0, "delay"=>30, "status"=>0}]}]}]}]
  return groups
  end
