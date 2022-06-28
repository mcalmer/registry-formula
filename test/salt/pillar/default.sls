# -*- coding: utf-8 -*-
# vim: ft=yaml
---
registry:
  log:
    level: info
    formatter: text
    fields:
      service: registry
      environment: production
  storage:
    cache:
      blobdescriptor: inmemory
    filesystem:
      rootdirectory: /var/lib/docker-registry
    delete:
      enabled: true
  auth:
    htpasswd:
      realm: basic-realm
      htpasswdfile: htpasswd
  http:
    addr: :5000
    headers:
      X-Content-Type-Options: [nosniff]
