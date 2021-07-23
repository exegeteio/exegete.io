---
layout: default
title: DBIx::Class::Validation Gotcha!
tags:
  - perl
---

[DBIx::Class::Validation](https://metacpan.org/pod/DBIx::Class::Validation) is
a validation library for [DBIx::Class](https://metacpan.org/pod/DBIx::Class)
objects to enable in-model validation.

When validating an object, however, DBIx::Class::Validation uses `croak` to
raise an exception if there are any invalid or missing values.  This makes all
the validation code look a *little* funky:

{% highlight perl %}
eval { $model->validate() };
if (my $result = $@) { ... }
{% endhighlight %}

Here's the kicker, though.  If the validation succeeds, the `$result` variable
does not exist.  "So what?", I hear you say.  Imagine writing a web form for
this.  You cannot get a valid `$result` unless errors are present, so you
cannot, for example, send a passing `$result` to the form template.  Now you
need two different forms, one with `$result` and one without.  🤢

---

*Yeah, the title is a bit click-bait-y.  This isn't really a "gotcha" (it is
right there in the docs, after all).*
