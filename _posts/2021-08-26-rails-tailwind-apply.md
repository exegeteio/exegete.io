---
layout: default
title: Rails + Tailwind + @apply
tags:
  - ruby
  - rails
  - css
---

[TailwindCSS](https://tailwindcss.com/) is an interesting concept.  At it's base
layer, Tailwind provides a set of CSS classes which can be used as if it were
inline CSS (`style="color: hotpink;"`).  However, there is another, and in my
opinion, more powerful way to use Tailwind.

## @apply

Tailwind, by virtue of using [PostCSS](https://postcss.org/), adds access to `@apply` in your processed CSS.  This allows you to use semantic names like `class="nav"` rather than `class="
