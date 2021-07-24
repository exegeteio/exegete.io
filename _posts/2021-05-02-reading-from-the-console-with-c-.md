---
layout: note
title: Reading from the Console with C#
tags:
  - c#
  - cli
---

Sometimes we need to read from the terminal in an app. Easy:

```c#
WriteLine();
string line = ReadLine();
ConsoleKeyInfo key = ReadKey();
Write();
```
