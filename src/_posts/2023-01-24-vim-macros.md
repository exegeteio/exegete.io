---
layout: default
title: vim Macros
tags:
  - vim
---

vim macros are a quick way to perform repetitive tasks quickly.  To start recording a macro, use
<kbd>q</kbd> followed by what letter you want to save the macro on, do the work you want to repeat,
and then press <kbd>q</kbd> again to stop recording.

For example (`<enter>` is a literal enter in this case):

```
qa80lBhr<enter>q
```

This would record a macro on the `a` key, then move 80 characters to the right, move to the
beginning of the current word, move one letter to the left, and replace that with a `\n`, and stop
recording.  I use this to quickly wrap lines at 80 characters.

To use the macro, use the `@` key, then the key where you recorded the macro.  For the above, `@a`
will run the macro.

Advanced mode, would be `7@a` to execute the macro 7 times.  The advantage to using `7@a` is that
undo will undo all 7 instances.
