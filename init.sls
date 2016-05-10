zabbix-agent:
  pkg.installed:
    - sources:
      - zabbix: salt://rpms/zabbix-2.4.7-1.el6.x86_64.rpm
      - zabbix-agent: salt://rpms/zabbix-agent-2.4.7-1.el6.x86_64.rpm
    
  service:
    - running
    - enable: True
    - watch:
      - file: /etc/zabbix/zabbix_agentd.conf
    - require:
      - pkg: zabbix-agent

/etc/zabbix/zabbix_agentd.conf:
  file.managed:
    - name: /etc/zabbix/zabbix_agentd.conf
    - user: root
    - group: root
    - mode: 644
    - source: salt://zabbix/zabbix-agent/etc/zabbix/zabbix_agentd.conf
    - template: jinja

/etc/zabbix/zabbix_agentd.d:
  file.recurse:
    - name: /etc/zabbix/zabbix_agentd.d
    - user: root
    - group: root
    - dir_mode: 644
    - file_mode: 644
    - include_empty: true
    - source: salt://zabbix/zabbix-agent/etc/zabbix/zabbix_agentd.d
    - require:
      - file: /etc/zabbix/zabbix_agentd.conf

/etc/sudoers.d/zabbix:
  file.managed:
    - name: /etc/sudoers.d/zabbix
    - user: root
    - group: root
    - mode: 644
    - source: salt://zabbix/zabbix-agent/etc/sudoers.d/zabbix
    - require:
      - file: /etc/zabbix/zabbix_agentd.d


