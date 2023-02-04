---
layout: default
title: Code as art?
tags:
  - opinion
  - blog
---

Some days I ponder if software development is akin to an entire team of people working on the same
art piece, all at the same time.

This stems from listening to [this keynote](https://youtu.be/rI8tNMsozo0) yesterday, after an episode of the
[Remote Ruby](https://remoteruby.com/216) podcast.  One of the things
which stood out to me, was Hickey’s suggestion to stick to standard data structures.  Much of the
time, I would agree with using the language built ins before creating a class, but the flip side of
that coin is you do not know how much scrutiny that data has undergone.

Do I need to nil-check elements in a provided hash?  Can I trust that the email attribute of the
hash formatted even remotely correctly?  Validation logic on a custom object would help you know
that the values are correct before they are passed to your function.

But this leads back to another conundrum:  In Ruby, how do we know we were passed a Person, and not
some other object?  If we check the type, Reek would call this a code smell.  Should we care, as
long as the argument quacks like a Person?  If our function can be passed any similar arguments,
should we nil-check values on the object?  Have we circled right back around to defensive
programming as if we had been passed a hash?

The answer to when to use each seems to be the maddening canned response: It depends.  It depends on
your team; can you trust them to know to call your function with a pre-validated hash?  It depends
on your codebase; does this match the existing patterns already present?  It depends on your
language; does your language have static types?  It depends on the function itself; how much damage
could be done by invalid arguments?

All of those decisions lead teams to have their own style, similar to a traditional artist.
Painters often have a go-to style; photographers often have a personal look; architects often work
in a specific style.

Is code art?  Is a program a canvas?  Who the heck am I to say, but it’s an interesting thought
experiment.
