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

Tailwind, by virtue of using [PostCSS](https://postcss.org/), adds access to
`@apply` in your processed CSS.  This allows you to use semantic names like
`class="nav"` rather than `class="bg-blue text-center shadow-md ..."`. To me,
this is much more legible and much more maintainable.

## Rails

Let us take a look at how we can use this in Rails.  First, install and set up
the
[`tailwindcss-rails-webpacker`](https://github.com/WizardComputer/tailwindcss-rails-webpacker)
package.

```sh
$ bin/bundle add tailwindcss-rails-webpacker
$ bin/rails tailwindcss:install
# Extra step as a demo, generate a page to test with.
$ bin/rails g controller root root
```

With this done, let's write some CSS with Tailwind.  Let's pop open
`app/javascript/stylesheets/application.scss` and add:

```scss
h1 {
  @apply p-2 mb-2 text-2xl text-center bg-blue-500 text-white shadow-md;
}
p {
  @apply text-center;
}
```

What is all this!?  Those are the classes exposed by Tailwind:

- `p-2` adds padding to the element.
- `mb-2` adds margin to the bottom of the element.
- `text-center` centers the text.
- ...

Any element can be styled this way.  Tags, classes, DOM ID, etc.

## Webpacker

Many observers may point out that TailwindCSS is a substantial bundle.  274kb (2.8mb uncompressed).  But what we just created is so little CSS, why would we load all of that?  We shouldn't.  PostCSS and Webpacker will take care of compressing this for us.  Let's look at the production-mode file sizes:

```sh
$ RAILS_ENV=production bin/rails assets:precompile
$ RAILS_ENV=production RAILS_SERVE_STATIC_FILES=1 bin/rails s
```

Looking now, the CSS comes down to 1.52kb (3.93kb uncompressed).  That size is
much more manageable.  PostCSS is going through our HTML/ERB and picking apart
which CSS classes we're using, and only including those in the bundle.

## Conclusion

In conclusion, TailwindCSS is a new, popular, CSS framework which encourages
custom CSS, but also encourages using standardizing things like padding and
margin.  This can be difficult to set up if you're not managing your own
pipeline, but Rails and the gems from above make setup trivial.

