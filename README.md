# HerokuDynoRestarter

A simple Rails gem that uses the [Heroku Platform API](https://github.com/heroku/platform-api) to restart dynos

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'heroku_dyno_restarter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install heroku_dyno_restarter

## Usage

First create an oauth token:

```
$ heroku plugins:install heroku-cli-oauth
$ heroku authorizations:create -d "Dyno Restarter Token"
Created OAuth authorization.
  ID:          1f02bba0-e5d2-4773-bf4e-2e320bb006cb
  Description: Dyno Restarter Token
  Scope:       global
  Token:       c3dd6bd6-126b-224e-b2be-c9fe52bc1ec6
```

And store that oauth token in an environment variable called `HEROKU_OAUTH_TOKEN`


To restart a specific dyno pass the application name and the dyno name:

```ruby
HerokuDynoRestarter.restart_dynos('my-test-application', 'web.2')
```

To restart all dynos of an application, pass the application name without a dyno name:

```ruby
HerokuDynoRestarter.restart_dynos('my-test-application')
```

To restart all dynos of a specific type, pass the application name and type [web/worker/foo]

```ruby
HerokuDynoRestarter.restart_dynos('my-test-application', 'web')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/heroku_dyno_restarter.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

