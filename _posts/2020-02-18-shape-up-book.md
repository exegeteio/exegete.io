---
layout: default
title: Shape Up
tags:
  - book
---

Below are my notes after reading [Shape Up](https://basecamp.com/shapeup), from
Basecamp. This free e-book can be quickly summarized with, "How Basecamp
approaches software development."

## Raw Idea

A raw idea is something like, "The customer wants a calendar". Sometimes the
raw ideas are very exciting, but we should temper the expectations.

Define the time around a good idea. Either

- 6 week cycles.
  - Small Batch - Takes a couple people 1-2 weeks to implement.
    - Several Small Batches get combined into a single 6 week cycle.
  - Big Batch - Takes the same size team the full 6 weeks to implement.

Don't shut down an idea right away, but don't give the impression of excitement,
meaning it will get done.

Take the time to get more information. Talk to the users. Adjust the scope.
Get details.

- What problem does this feature solve?
- What were you doing when the thought occurred to ask for this feature?
- If we can't find a specific paint point, or value proposition, table it. It's
  not critical.

## Grab-Bags

Beware of grab-bags. "Redesigns" or "refactoring". Caused by a lack of
expectations. "Redesign the files" vs. "Add previews to files".

## Appetite

Appetite is defined as the value of a project. How important is it. How well
understood is it? Until it is well understood, you cannot define how much you
want it. If you constrain an idea to a Small Batch, is it still as enticing?

Each idea is fixed to a specific timeframe, so you have fixed time but variable
scope. If a project won't fit in 6 weeks, can it be broken up smaller?

Appetite is applied at each part of the process. Even the R&D time. How much
appetite should we put in? Given the appetite, how much can we accomplish?

## Find the Elements

Closed door exercise without technical experts.

Adds value to the Raw Idea. Can still walk away as not too much has been added.
Gives ammunition if we do walk away, to set the appetite later. Keep these
organized!

Either work alone, or work with people who work at the same speed / level.

Avoid getting too specific too deep. Stay as high as you can while still
answering:

- Where does this go?
- How do you get to it?
- What are the key components?
- Where does it take you?

**This is not a deliverable!** This is an approach for how to solve the problem.

### Breadboarding

Closed door activity without technical experts. Discuss components, not specific design.

Drawing three things:

- Places - Pages, menus, dialogs.
- Affordances - Buttons, fields, and help text.
- Connection Lines - Shows how Affordances move a user from place to place.

Column layout. Place name at the top, and a line. Affordances below the line.
Connection lines from an Affordance to a Place.

This is flexible, change as needed. Leave old stuff around.

### Fat Marker Sketches

Helps slow down so you're not jumping ahead to too high of a fidelity.

Visual ideas require drawing. Adding details should be almost impossible. Crank
up the size of the marker / pen (in digital).

### Output

The output of either is a list of elements. Affordances from either Fat Marker
or Breadboarding.

### Room for Designers

Leaving out the details leaves the designer free from unintended direction.
However, a designer does not need so much freedom that they get lost looking
for, "Which is better?"

## Risks and Rabbit Holes

Closed door exercise to search out risks and rabbit holes before design begins.

Identifying risks is about depth of the project. What are the rabbit holes we
can fall down? What are the stumbling blocks? Is what we're talking about even
possible in the timelines?

This is the time to resolve technical unknowns. The suggestion is to walk
through the customer experience in slow motion.

- Does this require new technical work we're not familiar with?
- Are we making assumptions about how the parts fit together?
- Are we assuming a design solution exists that we couldn't come up with
  ourselves?
- Is there a hard decision we should settle in advance so it doesn't trip up
  the team?

"Out of Bounds" is a set of requirements you WILL NOT include in this specific
scope. For example, we may not address adding a second credit card processor to
each Payment Collector, when creating the Payment Collectors system. Define that
for another scope.

While defining out of bounds is also a good time to cut things back. If a
feature is a "nice-to-have", define it as such, but make it ancillary to the
project at hand. Do not list it in the main features.

While defining risks, may need to present the idea to technical experts. Rather
than write it up, present it more whiteboard-y. "Keep the clay wet, so they can
contribute". Less "This is something coming", and more "This is an idea I have,
but don't tell anyone." Beware "Is this possible?", as anything is possible. Be
more specific. "Is this possible in six weeks?" "Is this possible with pure
CSS?" Emphasize that you're looking for ways this could blow up in your face,
not looking for additional scope. Making sure the plan is safe. Shrinking the
scope is OK! If they can simplify it, awesome!

## Write The Pitch

The pitch puts the breadboarded and shaped feature into a format anyone should
be able to understand.

Ingredients:

- Problem - Why are we doing this?
- Appetite - How much time?
- Solution - The core elements.
- Rabbit holes - required details to prevent rabbit holes.
- No-gos - Things to NOT work on.

Never present a solution without a Problem. What if this Problem only effects
one person, for a few minutes per month. Appetite is a part of the problem
statement, as it limits the amount of time to fix the problem.

The Solution outlines what we're working on, so that nebulous statements like,
"The customers don't like it", do not pass muster. Add disclaimers where design
may be shown in a drawing, but is still flexible.

Pitches should be stored where they can be read asynchronously. Where each
better can review in their own time, keeping the "betting" time short.

## Bets, not Backlogs

Backlogs take time to maintain. Each better can keep track of the pitches that
don't get implemented. No centralized lists, but each person can keep their own
lists to advocate for later.
