---
layout: note
title: C# String Interpolation
tags:
  - c#
---

String Interpolation can be formatted with: `{index,alignment:formatString}`.

For formats see:
[https://docs.microsoft.com/en-us/dotnet/standard/base-types/formatting-types](https://docs.microsoft.com/en-us/dotnet/standard/base-types/formatting-types)

```c#
$"string with math:  {i * 2}";
$"string with 5 left-padding: {aStr,5}";
$"string with 5 right-padding: {aStr,-5}";
```
