---
layout: default
title: Bridgetown serve 404 errors
tags:
  - ruby
  - bridgetown
---

I reently migrated this site to
[Bridgetown](https://www.bridgetownrb.com/)
from
[Jekyll](https://jekyllrb.com/).
Bridgetown is a spiritual successor / fork of Jekyll, one of the original
static site generators.

When I started with bridgetown, I ran `bin/bridgetown serve`.  This seems like
a logical place to start, right?  Turns out the correct command is
`bin/bridgetown start`.  `serve` does not start the `esbuild` process, and
results in errors like the following:

```
[2022-12-22 06:32:50] ERROR `/_bridgetown/live_reload' not found.
[2022-12-22 06:32:53] ERROR `/_bridgetown/live_reload' not found.
[2022-12-22 06:32:56] ERROR `/_bridgetown/live_reload' not found.
```

I worked on this for a while before noticing this Deprecation warning which
scrolled off the screen when booting `serve`:

```
Deprecation: WEBrick (serve) will be removed in favor of Puma (start) in the next Bridgetown release
```

As a long time Rails dev, `serve` is just muscle memory.  I'll figure it out, though.