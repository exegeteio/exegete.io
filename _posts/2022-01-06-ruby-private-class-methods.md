---
layout: default
title: Ruby Private Class Methods
tags:
  - ruby
---

Ruby private methods are one of the stranger language features, IMO.  They work, but the syntax
always felt a tad strange.

```ruby
class User
  def name; end

  private

  def private_name; end
end
```

That works fine.  But what about class methods?

```ruby
class User
  def self.by_name(name); end

  private

  def self.find_by_name; end
end
```

Let's try it with `irb`:

```ruby
> User.find_by_name
=> nil
```

Huh?  That's a private method.  Why it work?  Because of what you're doing under the hood.  In this
case, `self` is the class.  You can crack open any Ruby class and add methods to it, so the
interpreter doesn't know what you want to do and assumes a public method.  So how do you define
a private class method?

```ruby
class User
  private_class_method def self.find_by_name; end
end
```

And try the method again:

```ruby
> User.find_by_name
> (irb):23:in `<main>': private method `find_by_name'  ...
`'`
```

Now we're private!
