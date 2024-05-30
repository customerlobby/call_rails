# CallRails

A ruby wrapper for CallRails API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'call_rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install call_rails

## Usage

### Configuration

Before you can make calls to CallRails you must configure the library with a valid api_key.

There are two ways to configure the gem. You can pass a hash of configuration options when you create a client, or you
can use a configure block.

Using an API Key:

```ruby
client = CallRails.client(api_key: "YOUR_API_KEY_HERE")
```

Or Alternatively

```ruby
CallRails.configure do |config|
  config.api_key = 'API_KEY'
end
```

Create CallRails client

```ruby
client = CallRails.client
```

### Get accounts

get all the accounts

```ruby
client.accounts
```

get specific account details

```ruby
client.account('id')
```

Use offset for pagination

 ```ruby
client.accounts(page: 1)
```

### Get Calls

get all the calls

```ruby
client.calls('account_id')
```

get specific call details

```ruby
client.call('account_id', 'call_id')
```

get call summary

```ruby
client.summary('account_id')
```

get call summary for first_time_callers

```ruby
client.summary('account_id', { group_by: 'company', fields: 'first_time_callers', start_date: Date.today - 23.months })
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can
also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the
version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version,
push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## CallRails API Docs
[CallRails API](https://apidocs.callrail.com/#getting-started)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/customerlobby/call_rails. This project is
intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to
the [code of conduct](https://github.com/customerlobby/call_rails/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CallRails project's codebases, issue trackers, chat rooms and mailing lists is expected to
follow the [code of conduct](https://github.com/customerlobby/call_rails/blob/master/CODE_OF_CONDUCT.md).
