---
layout: page
title: Posts
paginate:
  collection: posts
  per_page: 25
---

<ul>
  {% paginator.resources.each do |post| %}
    <li>
      <a href="{{ post.relative_url }}">{{ post.data.title }}</a>
    </li>
  {% end %}
</ul>

{%@ "paginator", paginator: paginator %}