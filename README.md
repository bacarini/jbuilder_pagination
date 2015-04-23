# Jbuilder::Pagination

[Jbuilder](https://github.com/rails/jbuilder) extension that makes easier to use pagination according to the [JSON API](http://jsonapi.org/format/#fetching-pagination) conventions.

## Requirement

It is based on [will_paginate](https://github.com/mislav/will_paginate).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jbuilder_pagination', require: 'jbuilder/pagination'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jbuilder_pagination

## Usage

```ruby
json.links do
  json.pages! @servers, url: "https://api.example.com/v1/servers"
end

# =>
#  "links": {
#      "pages": {
#          "first": "https://api.example.com/v1/servers/v1/servers?page=1&per_page=1",
#          "prev": "https://api.example.com/v1/servers/v1/servers?page=1&per_page=1",
#          "last": "https://api.example.com/v1/servers/v1/servers?page=3&per_page=1",
#          "next": "https://api.example.com/v1/servers/v1/servers?page=3&per_page=1"
#      }
#  },
```

In case there is no pagination at all, `links` will be omitted.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
