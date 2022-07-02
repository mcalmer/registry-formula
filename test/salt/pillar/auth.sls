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
      enabled: true
      blobdescriptor: inmemory
    filesystem:
      rootdirectory: /var/lib/docker-registry
    delete:
      enabled: true
  auth:
    enabled: true
    htpasswd:
      realm: basic-realm
      users:
        tux:
          password: penguin
  http:
    addr: :5000
    tls:
      enabled: true
      certificate: |
          -----BEGIN CERTIFICATE-----
          MIIFETCCA/mgAwIBAgIUFC2O4cCAmICQm1ON2Q4rZ3e9ne0wDQYJKoZIhvcNAQEL
          BQAwejELMAkGA1UEBhMCREUxDzANBgNVBAgMBkJheWVybjESMBAGA1UEBwwJTnVl
          cm5iZXJnMQ0wCwYDVQQKDARTVVNFMQ0wCwYDVQQLDARTVVNFMSgwJgYDVQQDDB9z
          dW1hLXJlZjQyLXNydi5tZ3IucHJ2LnN1c2UubmV0MB4XDTIyMDYyMjE0NTI1NFoX
          DTM4MDExODE0NTI1OFowgY8xCzAJBgNVBAYTAlVTMRcwFQYDVQQIDA5Ob3J0aCBD
          YXJvbGluYTEbMBkGA1UECgwSRXhhbXBsZSBDb3JwLiBJbmMuMQ0wCwYDVQQLDAR1
          bml0MRkwFwYDVQQDDBB0ZXN0LmV4YW1wbGUuY29tMSAwHgYJKoZIhvcNAQkBFhFh
          ZG1pbkBleGFtcGxlLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB
          ALIIMNonRG0Kl3Rq0uLL/t17j/BTl0169RF6pS8nKmxHuTocAEoRK5mjh7/pM8Uh
          /BfD2J1EGZTnysQQpFMDJt39wi5rhbuPr/b9KVe6HS8G5rp7+9sENyNUD4XHPozJ
          dCfrMphmPYYVKj9EhZJik/Es2oBU+oO2c6gSbfXlx21RrnrJQl4shhDANZR7/TJw
          oFLoZAQxdPqYtGB5Tn1HkeoNIdU1kNf9zKO5MXI7DyxMJ/45wLetfeGf4KHiQlb9
          IUn4W+Cf9nR46pcsSnZyAddayBeXKSmxH23Kud5ypU9X8FSet63KeKBTTL6fn+gp
          AeE283ZzeuR9LZAyu1jfMY8CAwEAAaOCAXcwggFzMAkGA1UdEwQCMAAwCwYDVR0P
          BAQDAgWgMB0GA1UdJQQWMBQGCCsGAQUFBwMBBggrBgEFBQcDAjARBglghkgBhvhC
          AQEEBAMCBkAwMQYJYIZIAYb4QgENBCQWIlJITiBTU0wgVG9vbCBHZW5lcmF0ZWQg
          Q2VydGlmaWNhdGUwHQYDVR0OBBYEFFUybZkSdFQEzBQVrGYigW5Wv5lzMIG3BgNV
          HSMEga8wgayAFD/pjFIGxhSug+uVpwhCpQB3ixt4oX6kfDB6MQswCQYDVQQGEwJE
          RTEPMA0GA1UECAwGQmF5ZXJuMRIwEAYDVQQHDAlOdWVybmJlcmcxDTALBgNVBAoM
          BFNVU0UxDTALBgNVBAsMBFNVU0UxKDAmBgNVBAMMH3N1bWEtcmVmNDItc3J2Lm1n
          ci5wcnYuc3VzZS5uZXSCFBQtjuHAgJiAkJtTjdkOK2d3vZ3rMBsGA1UdEQQUMBKC
          EHRlc3QuZXhhbXBsZS5jb20wDQYJKoZIhvcNAQELBQADggEBAFUJ6dafApJlFp+F
          ntjgvNOiAaoI4agKpX09qxUo3Y4B/ERpLRNOvN1Dreq+h5sYnsn2F/XhhE9JIo6e
          1l+zUVZZ8VxxD7LVnN1LTnly3rywfcJ0nGjaZrwotigNoibHh8c7VbPYfXJ4kZi2
          q6xdI9VJ7vgiAz8ZQSKHWTqzeJvt2/rNa+ZeEFPRaqUNdaB5rFPmJmNU6iDnkYbs
          yKehpnkICg6shlRp23oijD+osvJkVYfFv49chVoavQVR41YOBu7RJEJP98om/VEK
          oeHnBq3u9cR6rnEUEIn36nsdo+dtEW6mQP5KgsBm5I6/OMubz9q/Kw4mNFDO714Q
          9if2/08=
          -----END CERTIFICATE-----
      key: |
          -----BEGIN RSA PRIVATE KEY-----
          MIIEpAIBAAKCAQEAsggw2idEbQqXdGrS4sv+3XuP8FOXTXr1EXqlLycqbEe5OhwA
          ShErmaOHv+kzxSH8F8PYnUQZlOfKxBCkUwMm3f3CLmuFu4+v9v0pV7odLwbmunv7
          2wQ3I1QPhcc+jMl0J+symGY9hhUqP0SFkmKT8SzagFT6g7ZzqBJt9eXHbVGueslC
          XiyGEMA1lHv9MnCgUuhkBDF0+pi0YHlOfUeR6g0h1TWQ1/3Mo7kxcjsPLEwn/jnA
          t6194Z/goeJCVv0hSfhb4J/2dHjqlyxKdnIB11rIF5cpKbEfbcq53nKlT1fwVJ63
          rcp4oFNMvp+f6CkB4TbzdnN65H0tkDK7WN8xjwIDAQABAoIBAQCDsOdiF7XX6wPJ
          i9NfDIMElogMv+il2ZQ6T7ysuo349r0fLONR5o2X4o1h+kDfS5pMggRToLJDoYot
          qhnDhgtUHodrCwIrkcgaLX5NdFBuHu7Bd0D/64hVy7KHxLCSN9qCRMpyTP6pljJg
          BnG/rMe+mO0wDKwajfXTl35bbJMuWwdJ26LB9vUXRvcYWcmZ7gt3KQVVDjCtNUO6
          gPXzGLiA628pIKcw1wFimkWDSDTU1x6ixj2y6vLfE/YC/R+6L8vo8F7B0wvFTBWM
          BbG1xGRvWFaKS9xgkeNDU7hySqQ7bpopMFhRcHRd2jBy2dNa3azARQYZZm2AgXDC
          M/645T9xAoGBAN9n8Ozc3l15lhkS4Q0Na4toY+X6af5bVTUIlgwMCOCOphQGozlO
          cAvtoIs80p87+A7DeAK2XeGtvU6YlMElp3gWsjA2a8a98K0a3618o9UHgOfcVYlN
          GtLh5p5KRYsMVTQcY4f4rJa2OMRWOOR6LG5YzVafDx8pYF+Zaer0CASlAoGBAMwB
          j8NDIZ173NzVq4fJumpHO/wvK1r5rk+5B1iD/O2yXb+zpA1IOtgIfQECFKGX6G/+
          I8gzjyN+yGH8smfGXBpaK6xjJa1Rq7OCeJ/Uizw49yyRC5PnXnYWxPv1KBf65ylM
          wpOkNtnSn1z2gTVuraGUduLyQfcgtYcRDABZVCMjAoGAJ2SIkvuPKiRaVymBDXAk
          WnyZwN+a+QLZz3QoIQ+uMQp2NmnFNkGieDf6axLagMFuSAwniTLm8vhTvRwifrxI
          /1/hI6c08eJkIeHvNwQXT2T3UesEGiXCaRT0OU0XXiFalMm8sykiJaET+WrKtV7l
          nr+B1ZhObkw5diHzDz7gexECgYAO2fJAUcvJrjG29esl2H60q/jm8/whBFo3PY4W
          WI16NGj0wrwnp2F5Rqzq/N7JoMhwFr0+HtrFx74IvB+0xFECLhxN0W31vyNTzyS+
          5fc47CC6YtjH7KkIycGPYhqIHGDltcvYebTwiI/Hcb6YSDVltOwuu1ooBn6QlaId
          CGPCpwKBgQC71EI3L6yuIkqEQdaoJ3ZKUhmKqbpHOiQ0iqLgCLYLVaGuW76mekHs
          mhhnkmkn9uR2fWdo4JZrjzvs+DJXcTG2yQyWMrHdV0ME2+5FuQTl47rkKbelC/Eu
          oIVLu5/ZSjITBxgXdyTvU8rooVOxuQFU9Mnn51za+e6XtPvkHItZOA==
          -----END RSA PRIVATE KEY-----
      minimumtls: tls1.2
    headers:
      X-Content-Type-Options: [nosniff]
