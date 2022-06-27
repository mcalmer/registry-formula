# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as registry with context %}

registry-package-install-pkg-installed:
  pkg.installed:
    - name: {{ registry.pkg.name }}
