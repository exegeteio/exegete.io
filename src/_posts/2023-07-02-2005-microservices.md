---
layout: default
title: 2005-microservices.md
tags:
  - docker
  - silly
  - bash
  - go
  - rust
  - perl
---

I recently watched a
[reaction video](https://www.youtube.com/watch?v=xLAfC7a2ebM)
about
[an article](https://www.bitecode.dev/p/hype-cycles).
This got me thinking about how the architecture of the systems at my last
employer changed over the years, and if they qualify as microservice-ish.

## Background

At [Mexpro](https://www.mexpro.com/), I worked on the same application for ~15
years.  Over the years, feeling like I was being "left behind" working on a Perl
app, I fell into hype cycles.  I tried implementing parts of the system in
Python, NodeJS, and Ruby on Rails, essentially creating either microservices,
or micro-frontends (islands?).  The stack at the time rested on 2005
technology, so how did I build out services and frontends without modern
"cloud" techniques?

- When not running, each app scales to zero.
- Nearly-instant cold-boot times.
- Language agnostic.
- Interface [standardized](https://www.w3.org/CGI/) in 1995.
- Each app is independently deployable.
  - Not exhibited in the sample app.

## What was built

The core app was a Perl monolith, using
[HTML::Mason](https://metacpan.org/pod/HTML::Mason)
templates, and the
[Prototype](http://prototypejs.org/)
Javascript "framework", but had several microservices tacked on:

- Python microservice for interacting with Docusign.
- Ruby microservice for white-labeling the application for Affiliates.
- Go microservice for tracking page view events.

An important aspect here is that the Perl monolith did not call out to the
other services.

## Implementation

What is this amazing technology?
[CGI](https://en.wikipedia.org/wiki/Common_Gateway_Interface).

The core of the implementation is [Apache's httpd](https://httpd.apache.org).
`httpd` enables both Server Side Includes, and CGI execution allowing the
"islands" implementation, where the Perl monolith could output 
[special HTML comments](https://httpd.apache.org/docs/current/howto/ssi.html#basic)
which `httpd` would render call into the CGI scripts, and include the output in
the page.

I put together a dead-simple
[sample application](https://github.com/exegeteio/apache-microservices)
to demostrate the approach and benchmark execution.  This consists of four
"services" (they're "hello world" levels of complexity), written in Bash, Go,
Perl, and Rust, and compisited into a single page.  This means that each page
load in the data below includes a call to four microservices.

## Performance

I used the
[Apache Benchmark](https://httpd.apache.org/docs/2.4/programs/ab.html)
utility which ships with `httpd` to run tests.  Each test ran for 100,000
requests.

### 1 vCPU

On a single-core, $4/mo, Digital Ocean droplet:

#### Single User

            | min | mean | [+/-sd] | median | max
------------|----:|-----:|--------:|-------:|---:
Connect:    |   0 |    0 |     0.0 |      0 |   3
Processing: |  19 |   22 |     2.1 |     21 | 104
Waiting:    |   2 |    3 |     0.6 |      3 |  22
Total:      |  19 |   22 |     2.1 |     21 | 104

#### 5-Users

            | min | mean | [+/-sd] | median | max
------------|----:|-----:|--------:|-------:|---:
Connect:    |   0 |    0 |     0.1 |      0 |   4
Processing: |  23 |   61 |     8.0 |     61 | 199
Waiting:    |   2 |   15 |     4.2 |     15 | 137
Total:      |  23 |   61 |     8.0 |     61 | 199

#### 25-Users

            | min | mean | [+/-sd] | median | max
------------|----:|-----:|--------:|-------:|---:
Connect:    |   0 |    0 |   0.1   |      0 |   5
Processing: | 204 |  351 |  49.5   |    354 | 901
Waiting:    |   2 |   95 |  26.7   |     91 | 605
Total:      | 208 |  351 |  49.5   |    354 | 901

As we'd expect, the requests slow down as we increase concurrency.  Single CPU,
this is bound to happen.  Keep in mind that the benchmark was performed on the
same machine as the server was running on.

### 4 vCPU

On a four-core, $48/mo, Digital Ocean droplet:

#### Single Users

            | min | mean | [+/-sd] | median | max
------------|----:|-----:|--------:|-------:|---:

#### 5-Users

            | min | mean | [+/-sd] | median | max
------------|----:|-----:|--------:|-------:|---:
Connect:    |   0 |    0 |     0.0 |      0 |  2
Processing: |   9 |   17 |     5.3 |     15 | 54
Waiting:    |   2 |    4 |     1.5 |      3 | 24
Total:      |   9 |   17 |     5.3 |     15 | 54

#### 25-Users

            | min | mean | [+/-sd] | median | max
------------|----:|-----:|--------:|-------:|---:
Connect:    |   0 |    0 |     0.0 |      0 |   4
Processing: |  30 |   70 |    10.8 |     69 | 184
Waiting:    |   2 |   16 |     4.7 |     15 | 150
Total:      |  30 |   70 |    10.8 |     69 | 184

Requests time still increases with concurrency, but this time we can see that
vertically scaling the CPU allows the app to scale as well.

## The Future

There is nothing stopping CGI from continuing to be a viable option for this
type of service composition.  In addition, an upgrade to `nginx` can enhance the
situation with parallel processing Server Side Includes.
