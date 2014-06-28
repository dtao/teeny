# teeny

All right, so this is a *lot* like a project I just wrote a few days ago called [apiif](https://github.com/dtao/apiif) (for "API in folders").

With *that* project, you specify an API by using a simple directory structure to define your endpoints, with files called `get.json`, `post.json`, etc. to provide dummy data.

*This* project is similar, only instead of static files to provide dummy data you write actual Ruby scripts to expose the teeniest of microservices.

In the simplest (but my favorite) example, this allows you to, say, write **nothing more than a function**, and then make it a web service.

## example

Say we want to create a web service to provide random data. I'll use my dumb little [randy](https://github.com/dtao/randy) gem for this purpose, and I'll call the service "randyserv".

Here's how I can set up the code for the service:

    randyserv/
      Gemfile
      Procfile
      get.rb

And here's what those files might contain:

```ruby
# Gemfile

source 'https://rubygems.org'

gem 'randy'
gem 'teeny'
```

```
# Procfile

web: bundle exec teeny
```

```ruby
# get.rb

require 'randy'

Randy.string(params[:length] || 25)
```

**That's it.** Now I can push this service to Heroku, and when I make a GET request to it I'll get a random string back.
