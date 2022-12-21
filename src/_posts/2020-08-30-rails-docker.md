---
layout: default
title: Docker for Rails development
tags:
  - docker
  - ruby
  - rails
---

I find that running Rails apps in Docker can help make the app available across
platforms, and I tend to deploy containers in prod. To that end, how can we
set up Docker for a Rails app? YMMV, but this is what I like to use as my
baseline.

## Important Note

To use `rails new`, build from the `Dockerfile` with `--target=rails`.

```sh
$ docker build --tag=tmp/rails --target=rails .
$ alias rails="docker run --rm -it -w /app -v \$(pwd):/app tmp/rails rails"
$ rails new my-amazing-app
```

<script src="https://gist.github.com/exegeteio/e1455c587c8518a7e6f42b3b254874e6.js"></script>
