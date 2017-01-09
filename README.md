# GW2.rb
[![Travis CI Status](https://travis-ci.org/sinthetix/gw2rb.svg?branch=master)](https://travis-ci.org/sinthetix/gw2rb)

GW2.rb is a Ruby gem that wraps the GW2 API in a Ruby-flavored way. It is currently under development and is not ready for production yet.

## Table of Contents

* [Installation](#installation)
* [Usage](#usage)
  * [Standard Methods](#standard-methods)
    * [Achievements](#achievements)
    * [Dailies](#dailies)
    * [Professions](#professions)
  * [Authenticated Methods](#authenticated-methods)
* [Development](#development)
* [Contributing](#contributing)
* [License](#license)

## Future Installation
_Please not this is not hosted on RubyGems yet!_
Add this line to your application's Gemfile:

```ruby
gem 'gw2rb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gw2rb

## Usage

To initialize a client, you can call `GW2.client` with or without an API key:

```ruby
authenticated_client = GW2.client("BEST-API-KEY-EVER")
client = GW2.client
```

An API key is necessary to access many of the GW2 API endpoints and is highly recommended.

Methods return arrays or hashes with JSON-formatted key/value pairs.

### Standard Methods

The following methods can all be called without an API key.

#### Achievements
##### #all_achievements

Returns an array of all achievement IDs.

##### #achievements_info(id)

Returns a hash of information for the achievement IDs specified with the keys: `:id`, `:name`, `:description`, `:requirement`, `:locked_text`, `:type`, `:flags`, and `:tiers`.

The required `id` parameter takes:
* an Integer => `achievements_info(1)`
* a String of ID number(s) =>  `achievements_info("1,2,3")` or `achievements_info("1")`
* an Array of ID numbers => `achievements_info([1,2,3])` or `achievements_info(["1", "2", "3"])`

```ruby
achievement = @client.achievements_info(1)
achievement[:name]
# returns "Centaur Slayer"
```

##### #achievements_categories(id)

Returns an array of all achievement categories when not passed an ID.

When an ID is provided, returns a hash of information for the achievement category ID with the keys: `:id`, `:name`, `:description`, `:order`, `:icon`, and `:achievements`.

The optional `id` parameter takes:
* an Integer => `achievements_categories(1)`
* a String of ID number(s) =>  `achievements_categories("1,2,3")` or `achievements_categories("1")`
* an Array of ID numbers => `achievements_categories([1,2,3])` or `achievements_categories(["1", "2", "3"])`

```ruby
category = @client.achievements_categories(1)
category[:name]
# Returns "Slayer"
```

##### #achievements_groups(optional_id)

Returns an array of all achievement groups when not passed an ID.

When an ID is passed, returns a hash of information for the achievement category ID with the keys: `:id`, `:name`, `:description`, `:order`, and `:categories`.

The optional `id` parameter takes:
* a String of ID(s) =>  `achievements_categories('"45410F60-AB66-4146-A0F7-CE99250C4CB0",
  "A4ED8379-5B6B-4ECC-B6E1-70C350C902D2"')` or `achievements_categories("A4ED8379-5B6B-4ECC-B6E1-70C350C902D2")`
* an Array of IDs => `achievements_categories(["45410F60-AB66-4146-A0F7-CE99250C4CB0",
  "A4ED8379-5B6B-4ECC-B6E1-70C350C902D2"])`

```ruby
group = @client.achievement_groups("56A82BB9-6B07-4AB0-89EE-E4A6D68F5C47")
group[:name]
# Returns "General"
```
#### Dailies
##### #dailies

Returns a hash of information for today's daily achievements with the keys: `:pve`, `:pvp`, `:wvw`, and `:special`.

```ruby
dailies = @client.dailies
dailies[:pve]
# Returns an Array of Hashes where each item (Hash) in the array represents a daily pve achievement
```

##### #dailies_tomorrow

Returns a hash of information for tomorrow's daily achievements with the keys: `:pve`, `:pvp`, `:wvw`, and `:special`.

```ruby
dailies_tomorrow = @client.dailies_tomorrow
dailies_tomorrow[:wvw]
# Returns an Array of Hashes where each item (Hash) in the array represents a daily wvw achievement for tomorrow.
```

#### Professions
##### #all_professions
Returns an array of all profession IDs.

##### #professions_info
Returns a hash of information for specified profession(s) with the keys: `:id`, `:name`, `:icon`, `:icon_big`, `:specializations`, `:weapons`, and `:training`.

The required `id` parameter takes:
* a String of ID(s)=>  `professions_info("Mesmer, Thief")` or `professions_info("Mesmer")`
* an Array of IDs => `professions_info(["Mesmer", "Thief")`

```ruby
mesmer_info = @client.professions_info("Mesmer")
mesmer_info[:weapons][:Focus][:skills]
# Returns an Array of Hashes where each item (Hash) in the array represents a weapon skill
```

TODO: All other standard methods.

### Authenticated Methods

TODO: These :wink:

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sinthetix/gw2rb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
