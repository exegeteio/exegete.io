---
layout: default
title: Dapr + Minimal APIs
tags:
  - c#
  - dapr
---

I'm personally enamoured with the idea of what Dapr is bringing to the table,
and I like the simplicity of using C# 9's Top-level statements to create
applications and micro-services. These two combined create a wonderfully small
application which could offer a very compelling platform for work.

To that end I tossed together a couple demo apps.  The first app publishes a
counter to a queue, nothing special. The second subscribes to the queue and
publishes the square of the current count on an API.  Nothing special, but wait
until you see how much code there **isn't** in the app.

## Repo

I put all of this into a
[Github Repo](https://github.com/exegeteio/dapr-mini-api),
if you'd like to clone and/or play.

## Publisher

```c#
var dapr = new DaprClientBuilder().Build();

int currentCount = 0;
while (true)
{
    currentCount++;
    Console.WriteLine($"Publishing counter: {currentCount}");
    await dapr.PublishEventAsync("pubsub", "counter", currentCount);
    await Task.Delay(5000);
}
```

## Subscriber

```c#
// Removed the few lines of boilerplate and `using`.
// Decodes cloud events sent to the `MapPost` below.
app.UseCloudEvents();
// Adds an endpoint which tells Dapr where to send events from pubsub.
app.UseRouting();
app.UseEndpoints(endpoints => endpoints.MapSubscribeHandler());

var dapr = new DaprClientBuilder().Build();

// Pull state from Dapr.
// Minimal API will JSON encode the int for the browser.  May be blank until
// events are fired.
app.MapGet("/", async () => await dapr.GetStateAsync<int>("statestore", "counter"));

// `.WithTopic(...)` tells Dapr to subscribe to the given topic, and call this
// when a value is published.  This still works when posting directly to the
// endpoint!  😳
app.MapPost("/counter", async ([FromBody] int counter) =>
{
    var newCounter = counter * counter;
    Console.WriteLine($"Updating counter: {newCounter}");
    // Save state out to a data store.  We don't care which one!
    await dapr.SaveStateAsync("statestore", "counter", newCounter);
    return Results.Accepted("/", newCounter);
}).WithTopic("pubsub", "counter");

app.Run();
```

How cool is *that*!?  As you can probably see, .NET Minimal APIs removed all of
the complexity, and multiple files of even a starter .NET app.  Meanwhile, Dapr
removed all of the complexities of connecting to storage, pub/sub, service
discovery, etc.  Svelte, to the point, applications for microservices, but with
the power and ecosystem of C# and .NET.  I'm still not sold on microservices,
but I'm starting to get excited.
