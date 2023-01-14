---
layout: default
title: TypeScript - Typing Function
tags:
  - typescript
---

TypeScript allows you to utilize the `is` keyword as a method return to validate the `type` of an
object.

```typescript
interface IUser {
  firstName: string;
  height: number;
}

interface IAdmin extends IUser {
  superPower: () => void;
}

function isAdmin(object: unknown): object is IAdmin {
  return "height" in object && object.height > 195;
}

const resp = await fetch("https://dummyjson.com/users/3");
const user: unknown = await resp.json();

if (isAdmin(user)) {
  user.superPower(); // Auto-complete provided here!
}
```

Using `object is IAdmin` as the return type of `isAdmin` allows the function to work as a boolean in
practice, but it also tells your TypeScript tooling that the object **is** an `IAdmin` inside that
`if`.  So you should get Auto-complete, type checking, etc.
