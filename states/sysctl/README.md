# sysctl
Salt formula to manage sysctl properties

# Pillar
```sls
sysctl:
  vm.swappiness: 10
  vm.max_map_count: 262144
