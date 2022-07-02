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
      enabled: false
      blobdescriptor: inmemory
    filesystem:
      rootdirectory: /var/lib/docker-registry
    delete:
      enabled: true
  auth:
    htpasswd:
      realm: basic-realm
      users:
        tux:
          password: penguin
  http:
    addr: :5000
    tls:
      enabled: false
    headers:
      X-Content-Type-Options: [nosniff]
