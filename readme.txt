Version beta-2.0
Date: 2016-May-2nd

future plan:

1. To monitor more UHS services, future user-defined parameters/items will be
required.

2.  Zabbixs support send SMS/EMAIL notifications to system administrator,
deployment of this function require future development,

3. Trigger/Graphic/Discovery rules/Web scenarios scripts require future
development.

4. salt scripts to delopy the zabbix applications and scripts will be needed.
Also the directory and file path on salt-master and zabbix-server shall be
confirmed, because 
     this will be used in the zabbix scripts regarding the relative path.


current status:

1. zabbix-agent application has been installed in :

    redis-qa3b.zerowire.com
    netmon-qa1a.zerowire.com
    xtun-qa1a.zerowire.com
    xtun-qa2b.zerowire.com
    csgw-qa1a.zerowire.com
    csgw-qa3b.zerowire.com

    the iptables also has been modified on these servers.
    

    xtun-qa1a and xtun-qa2b have items monitoring xtun, notifym, notifyd,
webauth services.
    redis-qa3b has item monitoring redis ping response
     
    all the servers have items monitoring general information regarding
CPU/Memory/File/SSH.

Files need to be maintain:

./template
./zabbix

unless improvement rquired, do not change the scripts:

./generate-hostlist.rb
./generate-template.rb
./template-create-update.rb
./host-create-update.rb
./export-xml.rb
./import-xml.rb
./bin/*.rb
./lib/*.rb

files in ./conf are all generated.


1. Since Beta-1.6 is quite mature, I decided to upgrade the version number
   to 2.0 which can indicate this version is quite different from ver1.x.
2. Salt will be used to manage the packet of entire scripts files.
   Scripts can be classified into three categories:
   - class #1: run only on salt-master
   - class #2: run only zabbix-server
   - class #3: no implementation needed, but need to be deployed on each zabbix agent. 

3. The idea is 
   - first create a template for one type of server and put all the
     templates under one hostgroup. These will be done by the 
     'template-create-update.rb'. 
     the original data will come from ./conf/template.rb
     ./conf/template.rb is generated from script ./generate-template.rb
     the oringinal data for ./generate-template.rb will come from
     ./template.
     each type of server which is divided by the role of the server will
     have one script ./template/template-<$role>.rb plus a folder <$role>.
     e.g. xtun
     a script ./template/template-xtun.rb
     a folder ./template/xtun
     
     what is in the  ./template/template-xtun.rb
     def template_xtun()    <-- define a method
       template_xtun = [    <-- define a variable, it is an array,
         {
           "group" => "UHS Template",  <-- all the templates are under
                                           this hostgroup.
           "temps" => [                <-- contain different templates,
                                           every template will match one
                                           type of server.
             {
               "temp" => "Template xtun Services",  <-- define the name of
                                                        template. this name
                                                        has a keyword 'xtun'
                                                        whose spelling must
                                                        match the spelling
                                                        in the grain item
                                                        ['role'] in salt.
                                                       
               "apps" => []  <-- create an empty array which will contain 
                                 applications.
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
      # app_* will be a method defined in the scripts residing in 
        ./template/xtun.
      # each 'app_*.rb' script will an application with its items.
      # the idea is './template/xtun/app_*.rb' have all the items based
      # on the services in servers with a 'xtun'role.
      # ./template/template-xtun.rb will combine the 'app_*.rb' together
      # ./generate-template.rb will combine the './template/template_*.rb'
      # together and use these data to generate the './conf/template.rb'
      # a backup file will be created in './backup'
      

   - then create hostlist.
     run the './generate-host.rb' on salt master. the script
     will use the salt-command to generate the hostlist. 
     The hosts must be reachable from salt master and must return 'True'
     to test.ping request.
     the hostlist.rb will be stored in '/conf/hostlist.rb'
     a backup file will be created in './backup'


3. Class #1
   - generate-template.rb
   - generate-hostlist.rb
   
   The above two will be excuted on salt-master.
   required files './template'
   outcome:
     - ./conf/template.rb
     - ./conf/hostlist.rb
     - ./backup/template-#{date}.rb
     - ./backup/hostlist-#{date}.rb
   
   Class #2
   - template-create-update.rb
     create/update template/application/item
     all the template will be under one hostgroup
     if template/application/item don't exist, create them
     if exist, update them
     based on the names of template/application/item, so if want to change
     any name, will create a new one by script and delete the old manually

     require './bin'
     require './lib'
     require './conf'
     
     outcome:
     - ./log/template-#{date}.log

   - host-create-update.rb
     create/update hosts
     create hostgroups based on the roles of hosts.
     if the host doesn't exist, create it
     if exists, update it
     based on the names of hosts, so if want to change
     any name, will create a new one by script and delete the old manually
     host update will be tricky, 
     first it will locate all the linked templates,
     then it will unlike all the linked templates,
     then it will link new templates based on the role of host.
     
     require './bin'
     require './lib'
     require './conf'

     outcome:
       - ./log/host-#{date}.log
    
    - export-xml.rb/import-xml.rb
      after create/update hostgroup/template/application/item/host,
      use the export-xml.rb to generate xml file to backup all the 
      configuration.
      use the import-xml.rb to import the xml file to recovery the 
      configuration of hostgroup/template/application/item/host.

      require './bin'
      require './conf'
      require './lib/

      outcome:
        - ./xml/export.xml


      Class #3
      - ./zabbix
      files in this foler,
      ./zabbix/zabbix_agentd.conf must be distrubted to each zabbix-agent
      via salt
      path: /etc/zabbix

      ./zabbix/zabbix_agentd.d can be distrubted by salt or manually copied
      to each zabbix-agent
      path: /etc/zabbix
      files inside are user parameters which will be items in zabbix

      ./zabbix-sudo   can be distrubted by salt or manually copied
      to each zabbix-agent
      path: /etc/sudoers.d/

Directory Tree:

beta-2.0/
├── bin
│   ├── app_create.rb
│   ├── app_exists.rb
│   ├── app_update.rb
│   ├── group_create.rb
│   ├── group_exists.rb
│   ├── group_update.rb
│   ├── host_create.rb
│   ├── host_exists.rb
│   ├── host_update.rb
│   ├── item_create.rb
│   ├── item_exists.rb
│   ├── item_update.rb
│   ├── temp_create.rb
│   ├── temp_exists.rb
│   └── temp_update.rb
├── change-the-path-in-script-before-run
├── conf
│   ├── hostlist.rb
│   ├── template-1.rb
│   └── template.rb
├── export-xml.rb
├── generate-hostlist.rb
├── generate-template.rb
├── host-create-update.rb
├── import-xml.rb
├── lib
│   ├── get_auth.rb
│   └── json_body.rb
├── log
│   ├── host-2016-04-29.log
│   └── template-2016-04-29.log
├── readme.txt
├── template
│   ├── hostlist.rb
│   ├── template-basic.rb
│   ├── template-example.rb
│   ├── template.rb
│   ├── template-xtun.rb
│   └── xtun
│       ├── app-notifyd.rb
│       ├── app-notifym.rb
│       ├── app-webauth.rb
│       └── app-xtun.rb
├── template-create-update.rb
└── zabbix
    ├── zabbix_agentd.conf
    ├── zabbix_agentd.d
    │   ├── userparameter-basic
    │   ├── userparameter-notifyd
    │   ├── userparameter-notifym
    │   ├── userparameter-webauth
    │   └── userparameter-xtun
    └── zabbix-sudo

8 directories, 46 files   
      
Version beta-1.6
Data: 2016-4.29

1. beta-1.6 has greatly improved the speed of the conducting the scripts.
2. Directory structure:
   - root path:
     generate-hostlist.rb  >>>> This script is used to generate conf/hostlist
                                with salt commands.
                                run on salt-master

     generate-template.rb  >>>> This script is used to combin original 
                                template scripts into one script file. 
                                The combined script file will be 
                                conf/template.rb file.
                                This script will improve the increase, 
                                update and manage template's items.
                                run on salt-master

     template-create-update.rb >>>>  fisrt will call the create scripts and
                                     methods to create hostgroup/template/
                                     application/items. If element exists,
                                     will call the upgrade scripts and 
                                     methods instead. 
                                     existence check is based on the name
                                     of group/template/app.....
                                     if they are wrong in the template
                                     scripts, new element will be created.
                                     run on zabbix-server
      
      host-create-update.rb  >>>> similar with template-create-update.rb
                                  for creating and updating hosts.
                                  run on zabbix-server.

      export-xml.rb    >>>>  export hostgroup/template/host into a xml
                             file with configs as a backup/recovery method.
                             run on zabbix-server.
   
      import-xml.rb    >>>>  import hostgroup/template/host with configs
                             run on zabbix-server

     - folders
       - conf: including template.rb and hostlist.rb.
       - template: including orginal template files and backup hostlist.rb
       - bin: including all the functional scripts like createing/upgrading
       - lib: including get_auth.rb and json_body.rb.
              get_auth.rb is used to get auth value from zabbix server
              json_body.rb is used to convert ruby hash into json format.
       - zabbix:
           - zabbix_agentd.conf: configuration file of zabbix agent,
                                 use salt to populate this file to 
                                 /etc/zabbix/ on each zabbix agent
           - zabbix_agentd.d: including all the user defined parameters.
                              use salt to populate this file to
                              /etc/zabbix/ on each zabbix agent
           - zabbix-sudo: give sudo to user/group zabbix, required in user
                          defined parameters.
                          use salt to populate this file to /etc/sudoers.d/
                          on each zabbix agent
        - log: this folder and contents inside will be generated by 
               running host-create-update.rb/template-create-update.rb.
        
        - xml: this folder and contents  will be generated by export.xml and
               import.xml to contain the exported xml file.

  - working stream
  1. generate template.rb
  2. generate hostlist.rb
  3. populate the 
       - zabbix_agentd.conf, 
       - zabbix_agentd.d, 
       - zabbix-sudo 
     to zabbix agents via salt
  4. populate the 
       - template-create-update.rb
       - host-create-update.rb
       - bin
       - lib
       - conf
       - export.rb
       - import.rb
     to zabbix-server via salt
  5. on zabbix-server, run
      template-create-update.rb
      then
      host-create-update.rb
      then
      export.rb
      then
      backup the export.xml to salt-master


Version beta-1.4
Data: 2016-04-20

1. beta-1.4 supports create/update host/group/template/application/item

    - on salt-master, run the generate-hostlist.rb script which will generate
      the hostlist.rb in ./conf/ path by
      using salt commands to get original host information.
	- copy the beta-1.4 folder to zabbix server:/opt/uhs/scripts/zabbix,
      this can be done by salt population or manual scp copy.
  
    file:
    - create-host.rb   support create host and hostgroup
	- update-host.rb   support update host and hostgroup
	- create-temp.rb   support create template/application/items, support
	                   create default hostgroup "UHS Template"
	- update-temp.rb   support update template/application/items,
	- export-xml.rb    support export hostgroup/template/host into
	                   xml/export.xml
	- import-xml.rb    support import hostgroup/template/host from
	                   xml/export.xml
	
	folder:
	- bin      including create/existing check/update scripts for
                   host/group/template/application/item
	- conf     including hostlist.rb and template.rb. hostlist.rb is for
                   create-host.rb and update-host.rb.
	           template.rb is for create-temp.rb and update-temp.rb
        - lib      get_auth is used to get auth key, json_body is to generate
                   json scripts to communicatewith zabbix server.
	- zabbix   include zabbix_agentd.conf file which shall be copied in
                   every zabbix agent: /etc/zabbix,
                   zabbix-sudo shall be copied in every zabbix agent:
                   /etc/sudoers.d
                   ./zabbix-agentd.d/userparameter includes all the
                   user defined parameter. this file shall be copied to
                   every zabbix agent:/etc/zabbix/zabbix_agentd.d/ion beta-1.3

Beta-1.3
Date: 2016-04-14
1. add scripts:
   - ch_env_path.sh            change ruby environment and location of
                               scripts,
                               scripts can be run from outside
2. fix:
   - change some content error in conf/template.rb



Version beta-1.2
Date: 2016-04-13
1. add scripts:
   - update-host.rb            update host according to conf/hostlist.rb
   - update-temp.rb            update group/template/application/items
     according to conf/template.rb
   - export-xml.rb              export groups/templates/hosts into xml/export.xml
   - import-xml.rb              import
     groups/templates/applications/items/hosts from export.xml, result will be
stroed in xml/import.xml
   - in ./bin folder, groups/templates/application/items/hosts now has
     *_update.rb scripts


Version beta-1.1 
Date: 2016-04-12
1. 
  This ruby script packet is developed to create elements in Zabbix
  Server through JSON API interface provided by Zabbix Application.
2.
  Username and Password used to login web portal of zabbix server is 
  stored in ./lib/get_auth.rb. They should be replaced by pillar value
  in salt.

3.
  File Name                     Description
  create-host.rb                create hosts in zabbix server web
                                portal

  create-temp.rb                create hostgroup/template/application
                                /item in zabbix server

 ####################################
 # create file can identify wether  #
 # the creating element is a        #
 # existing one.                    #
 ####################################

  ./lib/get_auth.rb             get auth from zabbix server

  ./lib/json_body.rb            translate ruby into json format and 
                                propagate to zabbix server and get
                                response from zabbix server

  ./bin/app_create.rb           create application

  ./bin/app_exists.rb           get application id if exists

  ./bin/group_create.rb         create hostgroup

  ./bin/group_exists.rb         get group id if exists

  ./bin/host_create.rb          create host

  ./bin/host_exists.rb          get host id and template hostid if
                                exists

  ./bin/item_create.rb          create item

  ./bin/item_exists.rb          get item id if exists

  ./bin/temp_create.rb          create template

  ./bin/temp_exists.rb          get template id if exists

  ./conf/template.rb            including detailed list of hostgroup
                                /template/application/item.
                                list is made to show relationship 
                                between each element

  ./conf/hostlist.rb            including detailed list of host.

  ./conf/maplist.rb             links hosts with hostgroups and
                                templates which is mandatoryly
                                required to create a host.

3.
  create-host.rb and create-temp.rb will generate log file in 
  "./log" folder. If the folder does not exist, the scripts will
  create the folder fist.

4.
  future file list --- draft
  -
    massive update script
    delete script
    create trigger script
    create graphic script
    create alert script --- email, sms
    create discovery script
    create script script
    import/export xml template script
    
  future feature list --- draft
   -
     support SSL
