---
layout: default
title: Mojolicious - Perl Webapp Revisited
tags:
  - perl
---

I recently had a conversation with the lovely
[@LukeOCodes](https://twitter.com/lukeocodes) about the struggles I'm facing
with my current projects at work.  I maintain a legacy Perl monolith, using
[HTML::Mason](https://metacpan.org/pod/HTML::Mason), which essentially embeds
Perl similar to PHP3.  Embedded code in templates, no built in methods for MVC
control flow, and testing very difficult.

Luke mentioned the idea of creating an API, and layering a new view layer on
top.  Unfortunately, an IE dependency precludes using a modern Javascript
frontend such as [React](https://reactjs.org/) or [Vue](https://vuejs.org/).

However, there is more than one way to create an API.  Some API's are over the
web, while others are internal to an app.  I'm currently exploring Perl web 
frameworks which can use the existing API for backend logic, and move the
frontend logic from templates into controllers and Plain Old Perl Objects
(POPO's?, that doesn't sound right).

At the moment I'm exploring [Mojolicious](https://mojolicious.org/), an
all-inclusive micro-framework, similar to [Sinatra](http://sinatrarb.com/) or
[Express](https://expressjs.com/).  How micro?

```perl
use Mojolicious::Lite;
get '/' => {text => 'I ♥ Mojolicious!'};
app->start;
```

Pretty minimal, right?  This does hide a lot of complexity, however. 
Mojolicious has allowances to implement MVC, dumb templates, plugins,
middleware, sessions, and has allowances to make testing easier.  So far,
each hurdle I expected to be difficult has fallen like dominoes.  The hardest
part so far has been the convoluted business logic.  Not something a framework
can usually fix.  🙃

I'll be sure to check back as I dig deeper and come to a conclusion.
