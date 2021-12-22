docker-ce-service:
  service.running:
    - name: docker
    - enable: True
    - require:
      - pkg: docker-ce
