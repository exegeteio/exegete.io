---
layout: default
title: Workstations on Docker?
tags:
  - docker
  - linux
  - WIP
---

Can you run your entire working environment within a Docker container?  I'm going to find out.  To
get started we'll need a computer running Docker; in my case a 16" Intel Macbook Pro with Docker
Desktop.

## Alpine

Let's talk the wrong path... I started down the path of using Alpine Linux as my base image.  This
seemed like a good fit.  Small image, `apk` installs binaries very quickly for rebuilds, and is
something I've considered playing with for a while.  What went wrong?  Ruby **will not** compile for
me.  I tried various versions (3.0.3, 3.1, 2.7.4), from various sources (`rbenv`, `asdf`, and Ruby
source).  I need the ability to switch ruby versions, so getting rbenv of asdf working is rather
important.  Each build ended with:

```
uninitialized constant Kernel::Monitor (NameError)
```

Every-freaking-time!  Found a few references to this error online, but no solutions.  May revisit
later, but unsolved as of now.

## Ubuntu

Next up?  Ubuntu!  I know normal Ubuntu works.  Guess what?  It compiles Ruby!  That's a great
start.  What's next?  Docker in Docker.  Should be easy, right?  Take a look at `get.docker.com`,
and get Docker up and running, mount in `/var/run/docker.sock`, good to go.  Right?  Right?  Nope.
Access denied to the socket.  Turns out that on MacOS, you have to mount a "magic" file, not the
normal socket:  `/var/run/docker.raw.sock`.  That file doesn't exist on your system?  Mine either!
But guess what?  If you mount it, Docker starts working.  What the actual 🤬?  Anyway, it's working.

Ok, things look good!  Then comes the mount issues.  When you allow Docker to create the folder in
the container, the location with be `chown`ed to root.  Not good.  Sprinkle `mkdir` into Dockerfile.
That includes a `SSH_AUTH_SOCK`, which is stored in an unpredictable location.  Entrypoint for
`chown`.

Ok, so I think that is everything.  `docker compose up` - Oh *crap*.  How do I forward ports into
the workstation?  I could try to force everything onto a common port.  So the first thing I have to
learn in order to do anything is to set the port.  Yikes.  That's a huge stop.

## Conclusion

I'm shelving this project for now.  If you're interested in my progress, feel free to check out the
[workstation branch on Github](https://github.com/exegeteio/dotfiles/tree/workstation).  I may try
again at a later date, but for now I'm going to shelve it at ~6 hours of work.

