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
