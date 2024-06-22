# Komoru

Komoru provides convenient access to the KOMOJU API from Ruby applications.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add komoru

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install komoru

## Usage

Komoru provides `list`, `create`, `update`, `retrieve`, `delete`

```
client = Komoru::Client.new(secret_key: "sk_test_...")

# create a customer
client.customers.create(
  email: "test@example.com",
  payment_details: {
    type: "credit_card",
    number: "4111111111111111",
    month: 8,
    year: 2029
  }
)

# list customers
client.customers.list

# retrieve a customer
customer = client.customers.retrieve("54oy1car81mgztytc59ha8bgb")

# retrieve customer email
customer.email
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lamphanqg/komoru. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/lamphanqg/komoru/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Komoru project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/lamphanqg/komoru/blob/main/CODE_OF_CONDUCT.md).
