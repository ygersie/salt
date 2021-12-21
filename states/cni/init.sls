/opt/cni/bin:
  archive.extracted:
    - source: {{ salt['pillar.get']('cni:source') }}
    - source_hash: {{ salt['pillar.get']('cni:source_hash') }}

{% for cni_config in salt['pillar.get']('cni:config', {}) %}
/opt/cni/config/{{ cni_config }}.conflist:
  file.managed:
    - makedirs: True
    - contents_pillar: cni:{{ cni_config }}
{% endfor %}
