update_minion_conf:
  file.managed:
    - name: /etc/salt/minion.d/tuning.conf
    - mode: 640
    - user: root
    - group: root
    - source: salt://examples/minion_tuning.conf

restart_minions:
  service.running:
    - name: salt-minion
    - enable: True
    - watch:
      - file: update_minion_conf
