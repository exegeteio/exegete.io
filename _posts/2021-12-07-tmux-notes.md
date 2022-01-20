---
layout: default
title: tmux - Notes
tags:
  - tmux
  - cli
---

[`tmux`](https://github.com/tmux/tmux) is self-described as "A Terminal Multiplexer".  What the crap
does that mean?!  `tmux` is a window-manager for your terminal.  It allows you to have multiple
"panes" (windows) on the screen at once, as well as multiple tabs.

Many terminal apps (I use [iTerm2](https://iterm2.com/)) have similar functionality, but I prefer to
use a system which can work both locally and remotely.  I can remote into a machine, run `tmux`, and
have all the same functionality I'm used to having locally.

I use `tmux` every day so that I can have multiple files open on the same screen or to have
a command running along-side (or below, or behind, etc) the terminal I'm working in.

You operate tmux by using a `<leader>` key followed by a command key.  I use <kbd>Ctrl+b</kbd> for
my leader.  For example, to zoom a pane to fill the current tab, I would hit <kbd>Ctrl+b</kbd>
<kbd>z</kbd> (note that I let go of <kbd>Ctrl</kbd> before hitting <kbd>z</kbd>)

## Useful Commands

There are a few default commands I use every day which were not presented in my initial walk
through:

**Add `<leader>` before each of these!**

- <kbd>z</kbd> - Zooms the current pane to full-size.  Same combo restores the window.
- <kbd>q</kbd> - Overlay pane-numbers on the screen.  If you're quick, you can hit the pane-number
    to switch to that pane.
- <kbd>b</kbd> - Switch to the last-used pane.  Useful in combo with <kbd>q</kbd>.
- <kbd>Space</kbd> - Re-arrange your windows.  Hit a few times to cycle through options.
  - **Dangerous!** - There is no way to go back if you customized the size of your windows.
- <kbd>{</kbd> / <kbd>}</kbd> - Swap the position of the current pane with the previous / next pane.
- <kbd>[</kbd> - Freeze the current pane, and navigate around it.
  - Useful for scrolling back up off the screen with arrows / <kbd>Page Up</kbd> / <kbd>Page
      Down</kbd>.
  - Hit <kbd>Space</kbd> to turn on highlighting.  Highlight some text and hit <kbd>Enter</kbd> to
      copy.  Use <kbd>]</kbd> to paste.

