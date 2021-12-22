sshd-configtest:
  cmd.wait:
    - name: sshd -t

sshd-service:
  service.running:
    - name: ssh
    - enable: True
    - watch:
      - cmd: sshd-configtest
