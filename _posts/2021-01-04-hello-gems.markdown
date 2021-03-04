---
title: Hello, Gems!
page: post
layout: default
date: 2021-01-04
categories: onehundreddays ruby
---

**Heads up!** This is a part of the
[#100DaysOfBlog series](/categories/100days/){:title="100 Days of Blog series on Exegete.IO"}.
{:class="nes-container is-rounded centered"}

Gems are what Ruby uses for dependencies. The first Gem we need will be
[Bundler](https://bundler.io/){:title="Bundler"}.
Bundler can help you create, install, and manage your Gems. Check out their
docs to get started. **Gotcha!** Something that threw me early on is that
"bundler" is not the command for the Bundler app. The command is actually
"bundle".

The next thing we'll use is to create a Gemfile using bundler:

```shell
$ bundle init
Writing new Gemfile to hello-gems/Gemfile
```

Take a look at this brand new Gemfile:

```ruby
source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem "rails"
```

This is telling Bundler to use RubyGems.org to get our Gems from, and adds a
helper for installing Gems from Github. It also has a comment for the Rails
gem. We don't need that at the moment, but let's add
[Thor](http://whatisthor.com/){:title="Thor CLI Tools"}.

Now we can make make our
[Hello, World!]({% link _posts/2020-01-03-hello-world.markdown %}){:title="Thor CLI Tools"}
example more devout:

```ruby
#!/usr/bin/ruby
require 'bundler/setup'
require 'thor'

class Hello < Thor
  desc "hello NAME", "say hello to NAME"
  def hello(name='World')
    puts "Hello, #{name}!"
  end
end

Hello.start(ARGV)
```

This code sets up a new class, `Hello` which inherits from the `Thor` Gem, and
sets up a `hello` command. If we put this into `app.rb`, we can run the code
with:

```sh
$ ruby app.rb hello Mundo
Hello, Mundo!
```

There you are! Your first usage of a Gem! Head over to
[RubyGems.org](https://rubygems.org){:title="Ruby Gems"}
to look around at all the available Gems.
