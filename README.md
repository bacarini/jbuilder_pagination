# Jbuilder Pagination Plus [![Build Status](https://travis-ci.org/PinsterTeam/jbuilder_pagination_plus.svg?branch=master)](https://travis-ci.org/PinsterTeam/jbuilder_pagination_plus) [![Gem Version](https://badge.fury.io/rb/jbuilder_pagination_plus.svg)](https://badge.fury.io/rb/jbuilder_pagination_plus)

[Jbuilder](https://github.com/rails/jbuilder) extension that makes easier to use pagination according to the [JSON API](http://jsonapi.org/format/#fetching-pagination) conventions.

Forked from: [https://github.com/bacarini/jbuilder_pagination](https://github.com/bacarini/jbuilder_pagination)

## Requirement

`JbuilderPaginationPlus` relies on a paginated collection with the methods `current_page`, `total_pages`, and `size`, such as are supported by both [Kaminari](https://github.com/amatsuda/kaminari) or [WillPaginate](https://github.com/mislav/will_paginate).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jbuilder_pagination_plus', require: 'jbuilder/pagination'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jbuilder_pagination_plus

## Usage

###### Kaminari examples
```ruby
#array
@posts = paginate Kaminari.paginate_array([1, 2, 3])

#active_record
@posts = paginate Post
```

###### WillPaginate examples

```ruby
#array
@posts = [1,2,3].paginate(page: 3, per_page: 1)

#active_record
@posts = Post.page(3).per_page(1)
```

And then in your `*.json.jbuilder`

```ruby
json.links do
  json.pages! @posts, url: "http://example.com/posts", query_parameters: { additional: 'parameters' }
end
json.data do
  # Whatever your data is
end

# {
#    "links": {
#      "self": "http://example.com/posts?page[number]=3&page[size]=1&additional=parameters",
#      "first": "http://example.com/posts?page[number]=1&page[size]=1&additional=parameters",
#      "prev": "http://example.com/posts?page[number]=2&page[size]=1&additional=parameters",
#      "next": "http://example.com/posts?page[number]=4&page[size]=1&additional=parameters",
#      "last": "http://example.com/posts?page[number]=13&page[size]=1&additional=parameters"
#    },
#    "data": {
#      ...
#    } 
# }  
```
The options `url` and  `query_parameters` are opcionals.

In case there is no pagination at all, `links` will be omitted.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
