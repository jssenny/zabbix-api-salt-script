#!/opt/uhs/cots/ruby/bin/ruby
#-*- coding: UTF-8 -*-

def template_example()
template_example = [
  {
    "group" => "UHS Template",
    "temps" => [
      {
        "temp" => "Template #{role} Services",
        "apps" => [
          {
            "app" => "#{app1}",
            "items" => [
              {
                "item" => "#{item name}",
                "key_" => "#{item key}",
                "type" => 0,
                "value_type" => 3, #integ: 3, float, 0, char: 1
                "data_type" => 0,
                "units" => "",
                "formula" => 1,
                "multiplier" => 0, # 0 eq diable, 1 eq enable
                "delay" => 600,
                "status" => 0 # 0 eq enable, 1 eq disable
              }, 
              {
                "item" => "",
                "key_" => "",
                "type" => 0,
                "value_type" => 0,
                "data_type" => 0,
                "units" => "%",
                "formula" => 1,
                "multiplier" => 0,
                "delay" => 30,
                "status" => 0
              }
            ]
          }
        ]
      }
    ]
  }
]
return template_example
end
					
