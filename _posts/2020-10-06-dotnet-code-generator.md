---
layout: default
title: .NET CLI Code Generators
tags:
  - c#
  - dotnet
  - cli
---

The .NET CLI has plugins for generating code. For example, to scaffold a CRUD operation in Razor
pages:

{% highlight bash %}
$ dotnet tool install --global dotnet-aspnet-codegenerator
$ dotnet aspnet-codegenerator razorpage \
 -m Movie \ # Model name
-dc RazorPagesMovieContext \ # Database Context
-udl \ # Use Default Layout
-outDir Pages\Movies \ # Output directory
--referenceScriptLibraries # Whether or not to reference script libraries
{% endhighlight %}

This command will generate the scaffolding for CRUD operations on a `Movie` object, with a
`RazorPagesMovieContext` database context. This includes both the `cshtml` and `cshtml.cs`
files for the crud operations.

## [Reference](https://docs.microsoft.com/en-us/aspnet/core/tutorials/razor-pages/model?view=aspnetcore-3.1&tabs=visual-studio-code)
