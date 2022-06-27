# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as registry with context %}

registry-service-clean-service-dead:
  service.dead:
    - name: {{ registry.service.name }}
    - enable: False
