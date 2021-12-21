nomad-service:
  service.running:
    - name: nomad
    - enable: True
    - reload: True
    - require:
      - file: nomad-config-files
