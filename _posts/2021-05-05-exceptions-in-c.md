---
layout: default
title: Exceptions in C#
tags:
  - c#
---

```c#
try {}
catch (FormatException) {}
catch (OtherException ex) {} // ex is the exception object.
catch (Exception ex) { // All exceptions!
  WriteLine($"{ex.GetType()} says {ex.Message}");
}
```
