---
layout: default
title: Yoda Conditions
tags:
  - til
---

**Not an endorsement**: I'm not sure how I feel about this yet, but reviewing code, I do tend to
keep the constants at the end.

Today I learned that [Yoda Conditions](https://en.wikipedia.org/wiki/Yoda_conditions) are a thing.  
The core principal is to be consistent with where you put the constants in comparison operators.
Take the following examples:

```ruby
if 42 == answer {}
if answer == 42 {}
```

By having the constant after the comparison, you can quickly scan the code for which variables are
involved in the comparison.
