python development:
  pkg.installed:
    - name: python-devel

python2-pip:
  pkg.installed: []

restart the minion:
  service.running:
    - name: salt-minion
    - enable: True
    - watch:
      - pkg: python2-pip
