# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_package_install = tplroot ~ '.package.install' %}
{%- from tplroot ~ "/map.jinja" import mapdata as registry with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}
{#- ensure `configdir` ends with a '/' #}
{%- set configdir = registry.configdir | regex_replace('^(.+)([^/]+)/*$', '\\1\\2/') %}

include:
  - {{ sls_package_install }}

registry-config-file-file-managed:
  file.managed:
    - name: {{ configdir ~ 'config.yml' }}
    - source: {{ files_switch(['config.yml', 'config.yml.jinja'],
                              lookup='registry-config-file-file-managed'
                 )
              }}
    - mode: 644
    - user: root
    - group: {{ registry.rootgroup }}
    - makedirs: True
    - template: jinja
    - require:
      - sls: {{ sls_package_install }}
    - context:
        registry: {{ registry | json }}

{%- if registry.http.tls.enabled is defined and registry.http.tls.enabled %}

registry-config-file-certificate:
  file.managed:
    - name: {{ configdir + 'registry.crt' }}
    - contents_pillar: registry:http:tls:certificate
    - mode: 644
    - user: root
    - group: {{ registry.rootgroup }}
    - makedirs: True
    - require:
      - file: registry-config-file-file-managed

registry-config-file-key:
  file.managed:
    - name: {{ configdir + 'registry.key' }}
    - contents_pillar: registry:http:tls:key
    - mode: 600
    - user: {{ registry.registryuser }}
    - group: {{ registry.rootgroup }}
    - makedirs: True
    - dir_mode: 755
    - require:
      - file: registry-config-file-file-managed

{%- else %}

registry-conifg-file-clean-registry-cert:
  file.absent:
    - name: {{ configdir + 'registry.crt' }}

registry-conifg-file-clean-registry-key:
  file.absent:
    - name: {{ configdir + 'registry.key' }}

{%- endif %}
{%- if registry.auth.enabled is defined and registry.auth.enabled %}

registry-config-file-htpasswd-permissions:
  file.managed:
    - name: {{ configdir ~ 'htpasswd' }}
    - replace: False
    - user: {{ registry.registryuser }}
    - group: {{ registry.rootgroup }}
    - mode: 600

{%- for user in registry.auth.htpasswd.users %}
registry-config-file-htpasswd-{{ user }}:
  webutil.user_exists:
    - name: {{ user }}
    - password: {{ registry.auth.htpasswd.users.get(user, {}).get('password', None) }}
    - htpasswd_file: {{ configdir ~ 'htpasswd' }}
    - options: 'B'
    - update: True
    - runas: {{ registry.registryuser }}
    - require:
      - file: registry-config-file-htpasswd-permissions

{%- endfor %}
{%- else %}

registry-config-file-clean-htpasswd:
  file.absent:
    - name: {{ configdir + 'htpasswd' }}

{%- endif %}
