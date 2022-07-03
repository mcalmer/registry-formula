# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_service_clean = tplroot ~ '.service.clean' %}
{%- from tplroot ~ "/map.jinja" import mapdata as registry with context %}
{#- ensure configdir ends with a '/' #}
{%- set configdir = registry.configdir | regex_replace('^(.+)([^/]+)/*$', '\\1\\2/') %}

include:
  - {{ sls_service_clean }}

registry-config-clean-file-absent:
  file.absent:
    - name: {{ configdir + registry.configfile }}
    - require:
      - sls: {{ sls_service_clean }}

registry-config-clean-htpasswd:
  file.absent:
    - name: {{ configdir + 'htpasswd' }}

registry-conifg-clean-registry-cert:
  file.absent:
    - name: {{ configdir + 'registry.crt' }}

registry-conifg-clean-registry-key:
  file.absent:
    - name: {{ configdir + 'registry.key' }}
