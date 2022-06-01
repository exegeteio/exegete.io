---
layout: default
title: Go - File Structures
tags:
  - go
---

In a go project I ran into an issue in naming a package.  In this specific case, a `config` module
needed to be placed into `pkg/config/config.go`, rather than just `pkg/config.go`.  I do not think
the `pkg` bit matters at all.

Keep this in mind when creating go packages.
