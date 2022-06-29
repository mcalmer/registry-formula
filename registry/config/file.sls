# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_package_install = tplroot ~ '.package.install' %}
{%- from tplroot ~ "/map.jinja" import mapdata as registry with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

include:
  - {{ sls_package_install }}

registry-config-file-file-managed:
  file.managed:
    - name: {{ registry.configdir + registry.configfile }}
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

{%- if registry.authentication and registry.htpasswd.users is defined and registry.auth.htpasswd is defined %}

registry-config-file-htpasswd-permissions:
  file.managed:
    - name: {{ registry.configdir ~ registry.auth.htpasswd.htpasswdfile|default('htpasswd', true) }}
    - user: {{ registry.registryuser }}
    - group: {{ registry.rootgroup }}
    - mode: 600

{%- for user, passwd in registry.htpasswd.users.items() %}
registry-config-file-htpasswd-{{ user }}:
  webutil.user_exists:
    - name: {{ user }}
    - password: {{ passwd }}
    - htpasswd_file: {{ registry.configdir ~ registry.auth.htpasswd.htpasswdfile|default('htpasswd', true) }}
    - options: 'B'
    - require:
      - file: registry-config-file-htpasswd-permissions

{%- endfor %}
{%- endif %}
