---
layout: default
title: Database Migrations
tags:
  - c#
  - dotnet
  - cli
  - database
---

Keeping you database layout in sync with the your code is an important part of
any app with a database. Microsoft has created a tool for managing these
migrations.

```bash
$ dotnet tool install --global dotnet-ef
$ dotnet ef migrations add InitialCreate # Creates a migration.
$ dotnet ef database update # Update the database with latest migration.
```
