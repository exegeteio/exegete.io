---
layout: default
title: Running Pihole on Ubuntu
tags:
  - cli
  - network
---

Setting up a Pihole on modern Ubuntu requires modifying the `systemd-resolved` service to not listen
on port 53.  This is accomplished with some simple [commands from the official
docs](https://github.com/pi-hole/docker-pi-hole#installing-on-ubuntu-or-fedora):

```bash
sudo sed -r -i.orig 's/#?DNSStubListener=yes/DNSStubListener=no/g' /etc/systemd/resolved.conf
sudo sh -c 'rm /etc/resolv.conf && ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf'
sudo systemctl restart systemd-resolved
```

