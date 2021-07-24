---
layout: note
title: C# Switch Statements
tags:
  - c#
---

Sometimes a conditional statement would require too many if/then/else
statements to be concise. Switch statements to the rescue! 🦸‍♂️

## Syntax

```c#
switch (number)
{
  case 1:
    WriteLine("One");
    break; // Required.
  case 2:
    WriteLine("Two");
    break;
  case 3:
  case 4:
    WriteLine("3 || 4")
    goto case 1; // WHAAAT?!  Goto feels dirty.
  case Int64 j:
    // j is now the value, only get here if `number` is an Int64.
  default: // Always evaluated last, regardless of placement.
    // Do stuff.
    break;
}
```

## Alternate Syntax in C# 8

```c#
object i = 123;
var message = i switch
{
    int j => $"{j} and other text",
    null => "j is null",
    _ => "Default" // This is an underscore!
};
WriteLine(message);
```

## Functional Syntax

Different implementation for defining functions. More of an Functional/F# style?

```c#
static int Fib(int term) =>
  term switch {
    1 => 0,
    2 => 1,
    _ => Fib(term - 1) + Fib(term - 2)
  };
```

Interesting style. Seems to communicate a lot of info in a short statement.
