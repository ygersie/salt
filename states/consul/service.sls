consul-service:
  service.running:
    - enable: True
    - reload: True
    - require:
      - file: consul-config-files
