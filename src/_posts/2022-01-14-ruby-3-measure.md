---
layout: default
title: Ruby 3 - measure
tags:
  - ruby
---

**Note**:  I take no credit for finding this.  For an in-depth overview, check out
[Jemma Issroff](https://twitter.com/JemmaIssroff)'s
[IRB's Built-in Measure](https://jemma.dev/blog/irb-measure) post.

How do you know if a command you're running in Ruby is slow?  You can write a quick script using 
Ruby's [Benchmark](https://ruby-doc.org/stdlib-3.1.0/libdoc/benchmark/rdoc/Benchmark.html) module.
This is a great way to compare thousands of iterations of a specific code path.

But what about the random commands you run in the
[REPL](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop)?  Ruby 3.0 introduced the
`measure` module, which can be set to output a recap of each command:

```sh
irb> measure :stackprof
irb> Post.all.length
Post Load (376.7ms)  SELECT "posts".* FROM "posts"
==================================
Mode: cpu(1000)
Samples: 864 (3.25% miss rate)
GC: 93 (10.76%)
==================================
TOTAL   (pct) SAMPLES   (pct) FRAME
290   (33.6%)     289 (33.4%) SQLite3::Statement#step
136   (15.7%)     136 (15.7%) ActiveModel::AttributeSet#initialize
91    (10.5%)      91 (10.5%) (marking)
88    (10.2%)      88 (10.2%) ActiveRecord::Result#hash_rows
70     (8.1%)      70  (8.1%) Class#allocate
203   (23.5%)      67  (7.8%) ActiveModel::LazyAttributeSet#initialize
[snip]
=> 152941
```

This gives you a break down of where your code is spending its time.  This intentionally-bad query
spends quite a while in the SQLite3 module.  While I have yet to use this in anger, I am glad to
know it exists.

