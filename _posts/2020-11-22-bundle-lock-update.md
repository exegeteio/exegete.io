---
layout: default
title: Bundler - Gemfile.lock Update
tags:
  - ruby
  - bundler
---

Sometimes you need to update your `Gemfile.lock` without installing all the
gems. I'm looking at you Docker. This command will reach out to rubygems.org
and update the .lock file without actually downloading and installing the gems.

```bash
$ bundle lock --update
```
