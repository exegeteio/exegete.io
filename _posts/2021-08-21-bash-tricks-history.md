---
layout: default
title: Bash Tricks - History
tags:
  - cli
  - bash
---

Bash is a ubiquitous tool.  It's on more and more machines every day.  Even
Windows (with WSL) has a full Linux environment, and most default to a bash
shell.  Most people I watch on Twitch can get around, but I've been hearing on
podcasts that folks are learning little "secrets" of bash which I thought to be
common knowledge, so I want to share them.  This post is about using and
manipulating previous commands.

Let's start with basics.  Up arrow populates your command with previous commands
you've run, that seems commonly known.

One of my most frequently used features is `Ctrl+r`.  `Ctrl+r` searches through
your previous commands to re-execute them.  One common work flow for me is to
restart the `web` container in Docker Compose.  Hit `Ctrl+r` then type
`restart`, this usually populates my command with `docker compose restart web`.

The `history` command is fairly common, too.  `history | grep dapr` to see all
the previous `dapr` commands.  But we're going to one-up this knowledge:

```sh
$ history | grep dapr
 2409  gh repo clone exegeteio/dapr-mini-api
 2410  cd dapr-mini-api
 2421  dapr run -a dapr-mini-api-sub --app-port 5000 dotnet watch run
$ echo !2421
dapr run -a dapr-mini-api-sub --app-port 5000 dotnet watch run
```

Notice the numbers down the left of `history`?  That is the id of the command.
You can retrieve any of the commands in your history by entering a bang (bang
means `!`) and the id.  In the previous example, I pulled back up command
`2421`, and echoed it.  There are lots of these bang variables: 

```sh
$ gh repo clone exegeteio/dapr-mini-api
$ echo !! # Entire previous command.
gh repo clone exegeteio/dapr-mini-api
$ echo !$ # Last argument of previous command
exegeteio/dapr-mini-api
$ echo !gh # Last invocation of the `gh` command.
gh repo clone exegeteio/dapr-mini-api
$ echo !* # Arguments from last command
repo clone exegeteio/dapr-mini-api
```

Pretty sneaky, right?  If you use a fancy shell like zsh (the default in MacOS,
so my default now, too), hitting `tab` after any of those bang variables will
expand them inline for editing before running.
