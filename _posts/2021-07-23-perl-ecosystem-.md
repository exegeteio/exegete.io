---
layout: default
title: Perl Ecosystem?
tags:
  - perl
---

I've been working in the Perl ecosystem professionally for almost 18 years at
time of writing this. One thing I keep coming back to is how fragmented the
ecosystem is.

Let's consider writing a web application. First you must decided on a
framework:

- [Catalyst](https://metacpan.org/pod/Catalyst) - Full MVC framework, some
  strong opinions, but tries to be flexible first.
- [Dancer2](https://metacpan.org/pod/Dancer2) - Minimalist framework similar to
  Express for Javascript or Sinatra for Ruby.
- [Mojolicious](https://metacpan.org/pod/Mojolicious) - Real time framework
  with support for websockets.

Then you get to decide how to interact with your database:

- [DBI](https://metacpan.org/pod/DBI) - Bare bones, connect to the database and
  send SQL, receive back hashes and arrays.
  - This, at least, is pretty standard.
- [DBIx::Class](https://metacpan.org/pod/DBIx::Class)
- [Fey::ORM](https://metacpan.org/pod/Fey::ORM)
- [Rose::DB::Object](https://metacpan.org/pod/Rose::DB::Object)

Now lets look at options for validating form data before storage:

- [DBIx::Class::Validation](https://metacpan.org/pod/DBIx::Class::Validation)
- [HTML::FormFu](https://metacpan.org/pod/HTML::FormFu)
- [HTML::FormHandler](https://metacpan.org/pod/HTML::FormHandler)

## Silos

You may be thinking, "but choice is good, right?". Choice _is_ good. What's
bad is silos. When you're working on a Validation library without considering
how it will interact with an ORM. DBIx::Class::Validation attempts to integrate
with the ORM but, thanks to segregating missing and invalid fields, makes it
onerous to deal with errors in web forms.

When looking at other options in the web space, I find the most compelling to
be those with a solid core of modules. Look at C# with ASP.NET MVC and EF Core,
or Python with Django, or Ruby with Rails. Each of these frameworks carry with
it a solid set of _included_ functionality. You may stray beyond that initial
set, but for 90% of projects, the basics **just work**. Additionally any
solution which wishes to compete for that 90% must be as good or better than
the default.

## Conclusion

I do not mean to "bash" on Perl. Perl is a wonderful language with a
cornicopia of talented developers giving their time and effort to the
ecosystem. But could you recommend Perl to a new programmer who wants to make
web apps? I'd have a hard time suggesting a stack to work with, given the lack
of a standard set of known-good tools.

Disagree? Did I miss something? I'd love to hear from you. Hit the contact
button on my site.
