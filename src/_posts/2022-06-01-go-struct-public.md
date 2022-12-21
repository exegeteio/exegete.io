---
layout: default
title: Go Struct - Public?
tags:
  - go
---

When defining a `struct` in Go, the data portion of the `struct` has both internally visible and
externally visible portions (`domain` vs `Domain`).  Because you can attach a method to the
`struct`, the internal vs. external visibility is important.

```go
type Thing struct {
  internal: int
  External: int
}

// ...

t = Thing {
  internal: 1
  External: 2
}
log.Printf("%v", t) // Will not output `internal`.
```
