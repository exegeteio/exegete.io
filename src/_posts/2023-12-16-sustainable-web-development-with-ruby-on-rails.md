---
layout: default
title: Sustainable Web Development w/ Ruby on Rails
tags:
  - ruby
  - rails
  - book
---

This was a great read from David Bryant Copeland.  I was hoping to learn how I
could lead projects at my work to make them more sustainable, but I felt that
this book was more for green-field projects than 13 year old monoliths.

The key take-aways I got were:

- Giving developers choice for how to organize and architect code will lead to
  many different ways to accomplish the same goal.  Set a golden path and stick
  to it.
- Rails provides many fundamental objects for building webapps.  The book
  suggests treating these objects (Controllers, Models, Jobs, etc) as shims,
  while using Service objects to house actual business logic.
  - Validations can live in the Model because the abstraction is so good.
    - But real restrictions should be duplicated in the database itself.
    - Don't trust Validations to ensure data integrity.
    - Business logic should expose behavior.  It works with data to achieve
      a goal.
    - Use Thread local storage for context like `current_user`.
- The author suggests that your routes should only contain `resource` calls,
  except for vanity URL's.
  - A vanity URL redirects to one of the resource URL's, or renders a route
    directly.
- Use semantic HTML for components, then style with `<div>`, `<span>`, etc.

I can't say I understand or agree with all of these conclusions, but I believe
they would make a solid framework for a new application.
