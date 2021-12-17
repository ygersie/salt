# files
Files formula for Salt

# Pillar example
```sls
files:
  enabled:
    /tmp/myfile:
      contents: |
        somecontent here
        this can be anything
      user: myuser
      group: mygroup
      mode: 644

  disabled:
    - /tmp/myfile
```

All attributes, except **contents**, defined in the enabled hash will be passed 1:1 to the salt.file.managed state.
