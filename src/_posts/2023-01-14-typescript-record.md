---
layout: default
title: TypeScript - Record
tags:
  - typescript
---

The built-in `Record` type in TypeScript allows you to create an object with limited properties,
requiring each of the properties exist on the object.

```typescript
type Properties = "breakfast" | "lunch" | "dinner";
type Hybrid = [name: string, dominant: string, recessive: string];

const preferences: Record<Properties, Hybrid | string> = {
  breakfast: "blueberry",
  lunch: "raspberry",
  dinner: ["marionberry", "chehalem", "olallie"]
}

console.log(preferences.lunch); // "raspberry"
```

TypeScript handles this just fine.  I can assign any `string`, or any `Hybrid` to any of the
preexisting `Properties`.  But I cannot assign to a property which does not exist:

```typescript
const broken_prefs: Record<Properties, Hybrid | string> = {
  breakfast: "blueberry",
  lunch: "raspberry",
  dinner: ["marionberry", "chehalem", "olallie"]
  snack: "strawberry"
} // Type '{ snack: string; }' is not assignable to type 'Record<Properties, string | Hybrid>'.
```

This error is not exactly clear as to what has gone wrong, but the compiler is trying to communicate
that `snack` is not in `Properties`.  Adding `snack` to that array would clear things up for
`broken_prefs`, but we'd also need to add `snack` to `preferences`.
