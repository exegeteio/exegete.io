---
layout: default
title: HTTPie - Curl Replacement
tags:
  - cli
---

[HTTPie](https://httpie.io/) is a CLI tool for accessing web content.  Many
people have used `curl` or other CLI tools, but I prefer HTTPie for the simple
syntax and sane defaults.

## How To

```sh
$ http httpbin.org/status/418\?query=value Header:Value postbody=value
HTTP/1.1 418 I'M A TEAPOT
Access-Control-Allow-Credentials: true
Access-Control-Allow-Origin: *
Connection: keep-alive
Content-Length: 135
Date: Sat, 21 Aug 2021 12:50:44 GMT
Server: gunicorn/19.9.0
x-more-info: http://tools.ietf.org/html/rfc2324
```

Pretty simple.  Query params are part of the URL, as normal.  Put a `:` between
a key and value to send a header.  Put an `=` between a key and value to switch
to POST and send that value.  But how is this better than curl?  Let's look at
an example calling a local service; something I use constantly while developing.

```sh
$ http -p h :3000 
HTTP/1.1 200 OK
X-Request-Id: fee0fcbc-b5bb-49f9-a50b-b81046a34fdc
X-Runtime: 0.003309
```

What does that do?  `-p` tells what to print, response headers (`h`) in this case.
Then I tell it to connect to port 3000 on localhost with `:3000`.  That's all
you need.  It infers localhost.  

How about a bit of json (edited for brevity)?

```sh
$ http PUT httpbin.org/put hola=mundo
HTTP/1.1 200 OK
Server: gunicorn/19.9.0

{
    "data": "{\"hola\": \"mundo\"}",
    "headers": {
        "Accept": "application/json, */*;q=0.5",
    },
    "json": {
        "hola": "mundo"
    },
}
```

JSON is auto formatted and syntax highlighted.  Pretty colours and human
readable output.

Now for something that's just downright cool:

```sh
$ http -pb wttr.in/London\?0
Weather report: London

       .-.      Light rain
      (   ).    66 °F          
     (___(__)   ← 3 mph        
      ‘ ‘ ‘ ‘   6 mi           
     ‘ ‘ ‘ ‘    0.0 in         
```

I can take no credit for [wttr.in](https://github.com/chubin/wttr.in), but you
should totally check it out.