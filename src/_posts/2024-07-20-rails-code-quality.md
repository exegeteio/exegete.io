---
layout: default
title: Rails Code Quality
tags:
  - ruby
  - blog
  - rails
---

# Code Quality

**TL;DR**: Don't couple your business logic to your framework, and build and document your business logic as if it were a public API.

## Why Rails is Great

Rails gives very clear delineation of duties.  Each piece of the MVC framework is responsible for validating, securing, and processing the flow of requests within their own realm.

* Controllers - Responsible for securely transforming a web request into a business process and transforming the result of the business process into a web response.
* Models - Responsible for storing, fetching, and validating, the state required for a business process.
* Views - Responsible for presenting the results of a business process, in the form of a web response from the controllers.

An MVC framework like Rails prescribes these patterns which have been proven to provide agility, repeatability, and velocity when building out web applications.  What an MVC framework does not prescribe, however, is what to do with the "business process" which is mentioned in all three parts of the MVC.  Think of the business process as the part of your code which implements what makes your business special.  If you sell insurance, the business processes will likely be centered around rating, policy enforcement, customer service, etc.  If you sell books, the business processes will likely be centered around books, authors, shopping carts, inventory, etc.  You can think of the business process as the things you would have to do if your business existed before at-home computers.

However, there is always ancillary complexity required to sell your products.  Physical stores mop their showrooms, keep their windows clean, mow the grass, and even pick the cat hair out of their visitor chairs with tweezers.  On the web, we modify a HAML file to present the icons in cornflower blue.  Things which are paramount to doing business, but still not the core product.  These features are what your MVC framework is for, as very few businesses will find their products revolving around validating form submissions, managing how data is written to a database, or if a `<p>` tag is semantically better than a `<div>` tag for accessibility.

## Going off the Rails

What happens though, if you mix your business processes with your ancillary complexity?  In the physical store examples, you would not want your sales people out mowing the grass, while trying to give book recommendations.  So, too, you don't want your business logic embedded in your MVC framework.

Rails does not provide a prescription for what to do with business processes.  Rails went through a "skinny controllers, fat models phase", then a "fat models, skinny controllers" phase.  Both of these work well in the short term, but in the long term you're still mixing MVC with business processes.  Beyond Rails, in the gem ecosystem, you'll find no end to recommendations for how to handle business logic, from [Railway Oriented Programming](https://trailblazer.to/) to [Functional Service Objects](https://dry-rb.org/gems/dry-monads/).  I do not find the differences in the various implementation to be as important as the similarities.

## [Keep them Separated](https://www.youtube.com/watch?v=Dp4-jacnyH4)

The similarities of each approach I've seen is a clear boundary around your business processes, also called decoupling.  Decoupling your business processes with Ruby objects, Monads, or whatever other design your teams prefer, also tends to make the code more orthogonal.  Changes in the framework tend to have little to no impact on your business processes.

This decoupling forces your code to be given its inputs, and have specific outputs, rather than tightly coupling it to your Rails code preventing far-flung side effects.  A good example is a controller method which changes an instance variable, which has an effect on logic in another method.  By solidifying input and output, you also create an interface for your tests.  You can establish high quality coverage for your business processes in fast, isolated, tests, and augment those tests with a few, slower, controller tests to validate the logic in Rails.

The separation also helps lower cognitive overhead for developers, increasing their velocity.  By isolating concepts into coherent objects, developers can make a change without context switching between multiple objects.  This is not to say that you must follow the dogma of tiny functions and objects.  There is nothing wrong with methods undertaking many related actions, as long as the actions are coherent.  Objects with clearly defined inputs and outputs with code which tends to change together are easier to work with than traversing multiple small related objects.  Complex processes happen, and we should try to mitigate them, but sometimes a complex process that doesn't change often can go about its job without our interference.

## Building for Others

Another concept I find to have an outsized impact on productivity is building for someone else.  When you're building code you will implement, you tend to take liberties with the contract between your code and the code which calls it.  This can lead to tightly coupling to implementation details, which means changes to implementation requires changes to where your class is called from.  The only reason the code calling your classes should change is when the contract changes.

To help others use your code, establish a public API and prescribe how you want your code to be used.  Document the interface as a contract, give examples of how you intend it to be used, and what the side effects of your process are.  Build and document your business processes as if the public methods will be exposed on the internet, accompanied by only the documentation you wrote and your phone number.  You'll have the ability to clean up your return values, of course.

Return values are an important part of a contract which can be easy to overlook.  When we're consuming code we wrote, we often have a specific purpose for our code, and return a value for that specific purpose.  However, in order to make your code a better communicator, it is advisable to return all of the side effects of your process.  Any modified, created, or deleted, state may be important to the calling code.  While this does expose the internal workings of your code, it also makes the result of your code less surprising.  Less surprising code is easier to work with.  In tests, you can make assertions without having to re-fetch objects, or reach into implementation details to see what changed.

## Conclusion

Rails enables rapid implementation; one developer can ship an MVP internally in hours, rather than weeks or months.  However, taking a bit more time to decouple your business processes from your framework will make a huge difference if your app garners real usage.  You are modularizing your most important code, making it testable, re-usable, easier to modify/extend, and easier to train other developers on, as the business evolves.  And if you really [hockey-stick](https://en.wikipedia.org/wiki/Hockey_stick_graph), you should find it less painful to optimize your monolith, or even, 😱, break it apart into services.  After all, your code already has a documented public API, so why not?
