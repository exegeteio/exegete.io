---
layout: default
title: Why testable code?
tags:
  - blog
  - ruby
  - rails
  - testing
---

# Why testable code?

TL;DR:  Testable code is more important than the dogma of a specific approach to development.  Explicit inputs and outputs help make code testable, and will improve the quality of the codebase.

## Test Driven Design / Development

We've all heard the marching beat of Test Driven Development (TDD).  Red, Green, Refactor!  This is the way!  However, I don't believe that this **workflow** is as valuable as its zealots suggest.  However, that's not to say that the **results** are not every bit as valuable as they claim.

The workflow I've seen in TDD is to assume you're starting with a green-field (e.g. brand new) piece of code, then:

1. Modify your tests so that something related to your new code fails.
1. Write the minimal amount of code required to make the test pass.
1. Refactor the code and tests, if necessary, to make it easier to understand or easier to test.
1. Iterate wildly!

I find this approach is very productive when writing new code; be it a new class, a new method, or an entirely new app.  You don't need to mock up a UI to see that the code is working.  I like to put my tests on a loop so that the code is being tested as I write.  It's the same fast feedback loop that you get with Hot Reloading in web development, which is a revelatory in its impact.

Where TDD starts to fall apart is in an app with slow tests, flickering tests (sometimes they pass, sometimes they don't), or code which was retrofitted with tests.  I've been on codebases where you'd randomly get hundreds of failures which pass on a rerun.  I've been on codebases where individual tests take a full minute, and the entire suite would take over a day to complete locally.  The issue with slow or flickering tests is that it leads to multitasking.  If you are engaged in the work at hand, you may assume the test will pass and start working on the next problem, writing documentation, or refactoring.   If you're not engaged, it is a free moment to check email, Slack, or social media.  Either way, when your test finishes, you've already switched contexts, and have to spend mental energy to switch back.

Distractions are a problem in the short term, but in the long term retrofitted tests are worse.  Retrofitted tests usually show by the amount of setup required.  A dozen or more prerequisites (database entries, mocks, stubs, or even orchestrating the web UI) to test These prerequisites are used during execution of related code, but the logic under test doesn't need them.  This isn't to say that the code under test isn't brand new.  Sometimes you're just following the existing pattern, or something in the way the app is laid out forces you into this path of bloated, ancillary, context to execute tests.  

Developers must keep all of this context in mind while writing and debugging tests, as well as keeping the prerequisites up to date as they change.  Changes to unrelated code cause unexpected failures in your tests.  Take these errors as a warning sign of tightly coupled code.

Retrofitted tests can originate as tests being written after the code is in production, or by developers copying the existing patterns on new code.  Especially when you don't trust your tests, it can be daunting to refactor your code for testability, so it feels safer to replicate existing patterns than to create new ones.

## Course correction

There are two major starting points I've found for correcting away from these tests:

1. Implicit Inputs - Input which is gathered by your code as it executes, rather than being explicitly passed to your code.
2. Surprise Side Effects - Side effects (e.g. database writes, events broadcast, emails sent, exceptions handled, etc.) which are not passed back to the calling code as return values.

### Implicit input

The quickest way to correct the course of your tests is by looking at all the places where your code _retrieves_ input which affects how it behaves, rather than being given the input as arguments.  A common example is when using a feature flag (a piece of code for turning on and off parts of your code for specific users/groups/clients) to determine which behavior to use.  If your code reaches out to your feature flag library as a part of its execution, then you cannot test your code without doing something with the feature flag library.  For a single feature flag, this may seem inocuous, but it is a slippery slope.  It's only one flag, until the CEO is breathing down your neck on behalf of the "the next big client".  Eventually you'll have code behind a feature flag which calls out to other code with feature flags, and soon testing your code requires mocking out dozens of feature flags.   Eventually, you find out it is [turtles all the way down](https://en.wikipedia.org/wiki/Turtles_all_the_way_down).

Instead, if your code is told which features it should use, your tests can tell the code how to behave without relying on an external library.  You can setup the state of the world your code can see without worrying about the performance of other code.  Your tests do not need to change because the feature flag library changes.  For simple code, this can be accomplished by passing an additional argument.  For more complex code with many dependencies, however, you may want to consider a request object.  A request object can do the work of gathering all the information required for your code, and its dependencies, into a single resource.  If, for example, you have code which depends on many feature flags, you can codify that dependency in a request object dedicated to your code.  The request object, not your business logic, talks to the feature flag library.  Now changes to the outside world will be limited to impacting your request object.

As a bonus, having your inputs passed explicitly creates a roadmap for what tests you need to write.  If you know that the behavior of your code will be modified by a given argument, you know to test for variations on that input.  If your request object has 10 booleans in it, you know you need tests for all the various ways those flags can interact.

### Surprise side effects

Sometimes, a business process needs to do a surprising amount of work.  While finalizing an insurance policy you may create the database entries for a policy, spin up a background job for calculating commissions, and perform an API call to send a thank you email.  However, consider the impact of what this process returns.  If you return a boolean for success or failure, does true mean that the database record was created?  Does false mean that the API call failed?  The calling code doesn't have a way to know unless you explicitly pass this information via return values.  The developer who wrote the calling code may not even know about the API call and be surprised when emails get sent. Returning all of your side effects, also means that any code which depends your code can append your side effects to its own, to prevent even more upstream surprises.

Not knowing the side effects of your code, also means it is much more difficult to test your code without delving into its internals.  If you pass back all of the side effects, then your tests can assert that all parts of the process succeeded, and matches what you expected.  If you do not pass back the side effects, your tests will need to dig into your code's implementation, the database behind your implementation, or some other mechanism, to determine if the correct result was achieved.  Now your tests are tightly coupled to your implementation, and will change much more frequently.  Your tests should be focused on the public API of your code, and if you find yourself reaching into internals, this is a warning sign of incomplete return values.

Similar to implicit inputs, if you find yourself with many return values, you can wrap them into a result object to be returned.  Either way, the return values also give you a roadmap for what tests you need to write.  If you know your code is creating 10 side effects, you know you need at least one assertion on each.

## Conclusion

TDD is great, and I'm jealous of the folks who can embody it.  But, designing your code for testability by taking care with your inputs and outputs, can help you achieve much of the same value.  You should have more confidence that your tests are testing what they say they are, because your inputs and outputs provide a roadmap to work from.  The business should see improvements in developer confidence and team velocity, and a decrease in defects, as issues are caught earlier in the development cycle by good tests.  Even if your codebase doesn't provide these features now because it includes tests you don't trust/value/like, you can make incremental improvements.

## P.S. - A Bonus

I have to admit that I'm not that great at TDD.  I started life hacking on Perl scripts to make IRC bots, and I still have a hard time not taking this "make it work" kind of approach.  I'm more inclined to ship software, than make it perfect.  I always felt like TDD slowed me down too much, so I rejected it.  To that end, I usually find myself making something work, then writing tests for it.  Exactly what I just advised against!

In order to allow for my nature, I've adopted an approach of hack, test, delete, refactor, code:

1. Hack - Make the code do what I want, or: riding the struggle bus to understanding a solution.
1. Test - Retrofit tests onto the code I wrote.
1. Delete - Delete the original implementation.
1. Refactor - Refactor the tests to reflect how I want the code to work, not how the first iteration worked.
1. Code - Use the tests to rewrite the implementation.

At first, I felt like this approach was as slow as TDD, but I found myself liking it better because I got gratification at each step.  I got the code to work, party!  I got the code tested, party!  I deleted code, party!, etc.  While I know TDD can give similarly fast gratification, I find front-loading the struggle-bus gives me the confidence that I can do what I set out to do, and enables me to get fast feedback from stakeholders.  Meanwhile, the rest of the steps allow me to get the code into a testable, maintainable, state.

