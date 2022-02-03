---
layout: default
title: Single Responsibility
tags:
  - OOP
---

The [Single Responsibility
Principle](https://en.m.wikipedia.org/wiki/Single-responsibility_principle_
(SRP) gets tossed around a lot in Object Oriented Programming (OOP), but how can you tell if an
object or method is breaking SRP?

When looking at a method within a class, [Sandi Metz](https://sandimetz.com) suggests interrogating
the class as if it were a person.  Imagine a `Cog` class inside a Bicycle application with a method
`wheel_diameter`.  This method is used to calculate how far a bicycle will travel based on gear
ratio.  Let's interrogate it:

> Hey there, miss Cog, what is the diameter of a wheel?

Doesn't feel right, does it?  We logically know that a `Cog` is attached to a wheel, but it can be
attached to any wheel.

When looking at an individual method, I find writing a comment describing the class to be effective.
If you find yourself using "and" or "or", you may want to see if there is logic to extract from this
method.  For example, consider adding a `circumference` method on a `Wheel` class:

```ruby
# Calculates wheel + tire diameter and then calculates circumference.
def circumference
  Math::PI * (wheel_diameter + tire_size)
end
```

This has a sneaky "and" in there.  Adding a new method (`total_diameter`), would remove the "and",
and get this method back to a single responsibility.

This isn't a silver bullet, nothing ever is.  But it's a good first guess.
