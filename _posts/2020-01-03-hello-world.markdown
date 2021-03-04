---
title: Hello, World!
page: post
layout: default
date: 2021-01-03
categories: onehundreddays ruby
---

**Heads up!** This is a part of the
[#100DaysOfBlog series](/100days/){:title="100 Days of Blog series on Exegete.IO"}.
{:class="nes-container is-rounded centered"}

Ruby, like most imperative languages are fairly simple to get started with.
Here is the code to print "Hello, World!" to the screen.

```ruby
#!/usr/bin/ruby

puts 'Hello, World!'
```

Pretty straight forward, right? But that's not really all that useful.

Let's get the name we're welcoming from the command line:

```ruby
#!/usr/bin/ruby

name = ARGV.join(' ')
puts "Hello, #{name}!"
```

Not much of a change, but what's going on? `ARGV` is an array which contains all of the arguments from the command line. In this case, I'm using `join(' ')`
to combine all those values into a single string, then printing to the screen
with the variable embedded in a string.

It's hard to get a feel for a language from such simple code.
We'll get there.
