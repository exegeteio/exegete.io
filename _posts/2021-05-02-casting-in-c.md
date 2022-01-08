---
layout: default
title: Casting Variables in C#
tags:
  - c#
---

Casting is changing the type of a variable.

Converters for System types can be found in `System.Convert`. Also includes
`ToBase64String`.

C# does that weird thing where rounding is different for evan and odd numbers,
unless you explicitly tell it how to round with `Math.Round` or similar. Called
"Banker's Rounding".

```c#
int i = (int) aDouble;
int j = (int) 10.5; // j == 10
Math.Round(
  value: 10.5,
  digits: 0,
  mode: MidpointRounding.AwayFromZero
); // Output is 11.
```

Int can try to parse strings with a special method:

```c#
Write("How many eggs are there? ");
string input = ReadLine();

int count;
if (int.TryParse(input, out count)) {
    WriteLine($"There are {count} eggs.");
} else {
    WriteLine($"I could not parse your input:  {input}");
}
// count == either 0 or the value input.
```
