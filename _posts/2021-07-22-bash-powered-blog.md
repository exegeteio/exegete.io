---
layout: default
title: Bash Powered Blog
tag:
  - bash
  - vim
  - jekyll
---

So I got to thinking today... What if my notes were all searchable on Google? 
To a degree, they already are.  They're on
[Github](https://github.com/exegeteio/notes/), but there is a heckin'
limitation:  My learning is not linked!

Take this post, for example.  This is about three different things:

- vim - Quick way to edit files without any fuss or muss.  Edit anywhere. 
- bash - I use a quick bash script to edit the correct notes file, based on
  date and title.
- jekyll - This site is built with [Jekyll](https://jekyllrb.com/), a static
  site generator.

But how can I find all of my posts about C#?  Jekyll gives me tags!  All of the
posts about a specific topic are gathered by tag.  Now, I can have a single
click I can share with everything I know about a topic.  Or all the topics I
have learned.  👍

Ok, that's all good, but how does it work?  Well, let's write a quick shell
script:

# TODO:  Put the bash script here!

So what does this do?

1. Checks that a directory exists in the `$NOTES_PATH` environment variable.
1. 