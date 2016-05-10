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

template_xtun[0]["temps"][0]["apps"] += app_xtun
template_xtun[0]["temps"][0]["apps"] += app_notifym
template_xtun[0]["temps"][0]["apps"] += app_notifyd
template_xtun[0]["temps"][0]["apps"] += app_webauth

return template_xtun
end
					
