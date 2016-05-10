#!/opt/uhs/cots/ruby/bin/ruby
#-*- coding: UTF-8 -*-
$LOAD_PATH.unshift(File.dirname(__FILE__))

def template_xtun()
template_xtun = [
  {
    "group" => "UHS Template",
    "temps" => [
      {
        "temp" => "Template xtun Services",
        "apps" => []
      }
    ]
  }
]

template_xtun[0]["temps"][0]["apps"] += app_exmaple
# add new application with items here
# template_xtun[0]["temps"][0]["apps"] += app_new

return template_xtun
end
					
