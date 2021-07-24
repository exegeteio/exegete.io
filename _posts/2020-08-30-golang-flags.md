---
layout: note
title: Golang Flags Module
tags:
  - go
---

`flags` is a module for accepting and formatting command line flags.

## Setting up the expected flags

This sets up a count variable and accepts input.

```golang
var count int
flag.IntVar(&count, "t", 5, "a positive number to count to")
flag.Parse()
```

## Usage

To output usage instructions:

```golang
flag.Usage()
```

## Example

<script src="https://gist.github.com/exegeteio/36e47f3824a1278f90d17650fb734d52.js"></script>
