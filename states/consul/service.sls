consul-service:
  service.running:
    - name: consul
    - enable: True
    - reload: True
    - require:
      - file: consul-config-files
