# Sinatra::Drumkit

A simple framework for auto loading model and controller code in sinatra apps.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sinatra-drumkit'
```

And then execute:

```shell
$ bundle
```

Or install it yourself as:

```shell
$ gem install sinatra-drumkit
```

## Usage

`Sinatra::Drumkit` provides simple auto-loading mechanisms to `sinatra`. Once
the `module` is registered, one can configure it via the `rhythm`
method. `Drumkit` will make a best guess based on the `root` setting of the
application.

```ruby
class App < Sinatra::Base
  set :root, -> { File.expand_path(__dir__) }

  register Sinatra::Drumkit
  rhythm namespace: App

  # Models are now auto-loaded into App::Model...
  # Controllers have been executed in the context of the current app
end
```

Generally it search `PROJECT_ROOT/app/models` for model code and
`PROJECT_ROOT/app/controllers` for controller code.

One will need to set the parent name space for Models which will subsequently
be loaded into the `Namespace::Model` module.

Controllers are loaded and executed in the context of the application so they
can be written as though they were in the body of the `siantra` app.

```ruby
# file: ./app/controllers/index.rb

get /
  [200, {}, 'Hello world!']
end
```

## Development

After checking out the repo, run `bundle update` to install
dependencies. Then, run `rake spec` to run the tests.

To install this gem onto your local machine, run `bundle exec rake
install`. To release a new version, update the version number in `version.rb`,
and then run `bundle exec rake release`, which will create a git tag for the
version, push git commits and tags, and push the `.gem` file
to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/[USERNAME]/sinatra-drumkit. This project is intended to be
a safe, welcoming space for collaboration, and contributors are expected to
adhere to the [Contributor Covenant](http://contributor-covenant.org) code of
conduct.

## License

The gem is available as open source under the terms of
the [MIT License](http://opensource.org/licenses/MIT).
