---
layout: default
title: Bookmarklets
tags:
  - tools
---

Bookmarklets are snippets of Javascript you store in a bookmark and execute against a page on the
internet.

For example, if you use Duck Duck Go for your default search (you really should give it a week-long
trial if you haven't), but you feel Google will have better results?  Switch from Duck Duck Go to
Google with one click:

```javascript
javascript:window.location = window.location.toString().replace('duckduckgo.com/',
'google.com/search');
```

This works by replacing the phrase `duckduckgo.com/` with `google.com/search`, so you could change
any URL this way.

In another example, my local newspaper stuffs a bunch of ads in the navigation at the top of the
page, which makes the page unusable.  So let's remove the navbar itself:

```javascript
javascript:document.getElementById('site-navbar-container').remove();
```

**Note:** This assumes the annoying ads are in an HTML element with the
`id="site-navbar-container"`.

But how does this work?  Create a bookmark in your favorite browser (I put them on my bookmark bar
so they are close at hand), and edit the "Address" (or "URL", or "Website", browser depending) to be
the script above.  You can then set the Name to anything you'd like.  When you're ready, click the
link.
