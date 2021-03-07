---
layout: default
title: Exegete.IO
description: Who is Exegete?  What do they do?
---

## About

By day, a developer, sys admin, and manager working in insurance since 2004. By night, a father, a cyclist, a motorcyclist, and a general-purpose nerd.

## Skills

{% for skill in site.data.skills %}

- {{skill.name}} - {{skill.experience}}
  {% endfor %}

## Experience

{% for exp in site.data.experience %}

### {{exp.title}} ({{exp.timeframe}}) - {{exp.location}}

{{ exp.description | markdownify}}
{% endfor %}
