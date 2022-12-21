---
layout: default
title: Ruby Bytecode
tags:
  - ruby
---

Youtube, in all its glory, suggested a wonderful [Aaron Patterson](https://twitter.com/tenderlove)
talk to me today, titled 
[Inside Ruby's VM, The TMI Edition](https://www.youtube.com/watch?v=CT8JSJkymZM).  What a heckin'
great talk!  Granted, I find most of Aaron's talks amazing, but this one really flipped some
switches for me.

The bit that really got me was talking about reading the Ruby VM's bytecode for some code.  Let's
take a look:

```ruby
z = RubyVM::InstructionSequence.new <<-eoruby
x = "\#{foo}\#{bar}"
eoruby
puts z.disasm
```

This produces the following output:

```
0000 putobject                              ""                        (   1)[Li]
0002 putself
0003 opt_send_without_block                 <calldata!mid:foo, argc:0, FCALL|VCALL|ARGS_SIMPLE>
0005 dup
0006 objtostring                            <calldata!mid:to_s, argc:0, FCALL|ARGS_SIMPLE>
0008 anytostring
0009 putself
0010 opt_send_without_block                 <calldata!mid:bar, argc:0, FCALL|VCALL|ARGS_SIMPLE>
0012 dup
0013 objtostring                            <calldata!mid:to_s, argc:0, FCALL|ARGS_SIMPLE>
0015 anytostring
0016 concatstrings                          3
0018 dup
0019 setlocal_WC_0                          x@0
0021 leave
```

That's a fair amount of instructions to concat a string together, using string interpolation.
However, what if we do the concat differently?

```ruby
z = RubyVM::InstructionSequence.new <<-eoruby
x = foo + bar
eoruby
puts z.disasm
```

This produces the following output:

```
0000 putself                                                          (   1)[Li]
0001 opt_send_without_block                 <calldata!mid:foo, argc:0, FCALL|VCALL|ARGS_SIMPLE>
0003 putself
0004 opt_send_without_block                 <calldata!mid:bar, argc:0, FCALL|VCALL|ARGS_SIMPLE>
0006 opt_plus                               <calldata!mid:+, argc:1, ARGS_SIMPLE>[CcCr]
0008 dup
0009 setlocal_WC_0                          x@0
0011 leave
```

A few less instructions.  This shows the internals of how Ruby optimizes some code paths.  For
example, there was a time when single-quoted strings were preferred for performance reasons.  Let's
take a look:


```ruby
z = RubyVM::InstructionSequence.new <<-eoruby
x = "foobar"
y = 'bazbang'
eoruby
puts z.disasm
```

Looks pretty similar to me:

```
0000 putstring                              "foobar"                  (   1)[Li]
0002 setlocal_WC_0                          x@0
0004 putstring                              "bazbang"                 (   2)[Li]
0006 dup
0007 setlocal_WC_0                          y@1
0009 leave
```

Very cool stuff!
