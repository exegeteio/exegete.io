---
layout: default
title: Mobile Dev Setup
tags:
  - hardware
---

I've been debating buying a new Macbook Pro M1 since they ironed out the development issues shortly
after launch.  However, I've had very little time for development outside of work, so I find it hard
to invest into that much hardware.  My iPad, however, I use constantly.  It sits on my desk while
I work for notes and blogging.

I decided to explore if this could work, and so far it has worked better than I expected.

## Hardware

This is a mostly-software solution, though I would highly advise a nice keyboard, such as Apple's
Magic Keyboard, or a nice Bluetooth external jobber.  This is a very personal choice, so I'll leave
this up to you.

- iPad Pro M2 - 12.9"
- Magic Keyboard
- Mac Studio
  - Optional - You can use any machine you can SSH into for this setup, but I like having it on the
      same machine I would do dev work on at home.

## Software

- [Tailscale](https://tailscale.com/) - Point-to-point VPN for connecting back to the Mac Studio
    when on the road.  Very simple VPN setup which only routes the specific IP's for your devices in
    Tailscale.
- [Blink](https://blink.sh/) - iOS Shell app with integrated SSH and Mosh client.
    - I have not gotten it to work well, but Blink does have a [VS Code
        integration](https://docs.blink.sh/advanced/code).  I'm hoping that the new VS Code remote
        tunnels will make this even better!
- [mosh](https://mosh.org) - Resumable SSH connections.  Requires install on your server, but is
    included in Blink.  This helps if your iPad falls asleep, or you change to another app for too
    long.

## Improvement Ideas

- I plan to try to use the VS Code integration with Blink.  VS Code is my normal desktop
    editor with it's best-in-class VIM support, plus everything else VS Code has to offer.
- I am going to see if using the Apple Magic Keyboard (for the desktop, not the iPad; dang that's
    confusing!) is any better, as sometimes I want the iPad farther from me.

## Conclusion

So far, I'm using the above to connect and run vim inside tmux on my iPad.  There is very little
network lag thanks to Tailscale (and a 5G iPhone).  mosh allows me to sleep the iPad and resume
right where I left off, and if mosh fails, tmux is my backup.



