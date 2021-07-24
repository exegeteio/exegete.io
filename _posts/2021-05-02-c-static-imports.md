---
layout: note
title: C# Static Imports
tags:
  - c#
---

Static imports import methods from a module into the current scope. So if you
find yourself using `WriteLine` frequently? Consider a static import.

```c#
using static System.Console;
WriteLine("Whatever");
```
