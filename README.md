# GW2.rb
[![Travis CI Status](https://travis-ci.org/sinthetix/gw2rb.svg?branch=master)](https://travis-ci.org/sinthetix/gw2rb)

GW2.rb is a Ruby gem that wraps the GW2 API in a Ruby-flavored way. It is currently under development and is not ready for production yet.

## Table of Contents
* [Installation](#installation)
* [Usage](#usage)
  * [Standard Methods](#standard-methods)
    * [Achievements](#achievements)
    * [Dailies](#dailies)
    * [Legends](#legends)
    * [Professions](#professions)
    * [Skills](#skills)
    * [Specializations](#specializations)
    * [Traits](#traits)
  * [Authenticated Methods](#authenticated-methods)
* [Development](#development)
* [Contributing](#contributing)
* [License](#license)

## Installation
_Please note this is not hosted on RubyGems yet! This is merely placeholder information!_
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

##### #achievement_info(id)
Returns a hash of information for the achievement IDs specified with the keys: `:id`, `:name`, `:description`, `:requirement`, `:locked_text`, `:type`, `:flags`, and `:tiers`.

The required `id` parameter takes:
* an Integer => `achievement_info(1)`
* a String of ID number(s) =>  `achievement_info("1,2,3")` or `achievement_info("1")`
* an Array of ID numbers => `achievement_info([1,2,3])` or `achievement_info(["1", "2", "3"])`

```ruby
achievement = @client.achievement_info(1)
achievement[:name]
# returns "Centaur Slayer"
```

##### #achievement_categories(id)
Returns an array of all achievement categories when not passed an ID.

When an ID is provided, returns a hash of information for the achievement category ID with the keys: `:id`, `:name`, `:description`, `:order`, `:icon`, and `:achievements`.

The optional `id` parameter takes:
* an Integer => `achievement_categories(1)`
* a String of ID number(s) =>  `achievement_categories("1,2,3")` or `achievement_categories("1")`
* an Array of ID numbers => `achievement_categories([1,2,3])` or `achievement_categories(["1", "2", "3"])`

```ruby
category = @client.achievement_categories(1)
category[:name]
# Returns "Slayer"
```

##### #achievement_groups(optional_id)
Returns an array of all achievement groups when not passed an ID.

When an ID is passed, returns a hash of information for the achievement category ID with the keys: `:id`, `:name`, `:description`, `:order`, and `:categories`.

The optional `id` parameter takes:
* a String of ID(s) =>  `achievement_groups('"45410F60-AB66-4146-A0F7-CE99250C4CB0",
  "A4ED8379-5B6B-4ECC-B6E1-70C350C902D2"')` or `achievement_groups("A4ED8379-5B6B-4ECC-B6E1-70C350C902D2")`
* an Array of IDs => `achievement_groups(["45410F60-AB66-4146-A0F7-CE99250C4CB0",
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
# Returns an array of hashes where each item (hash) in the array represents a daily pve achievement
```

##### #dailies_tomorrow
Returns a hash of information for tomorrow's daily achievements with the keys: `:pve`, `:pvp`, `:wvw`, and `:special`.

```ruby
dailies_tomorrow = @client.dailies_tomorrow
dailies_tomorrow[:wvw]
# Returns an array of hashes where each item (hash) in the array represents a daily wvw achievement for tomorrow.
```

#### Legends
##### #all_legends
Returns an array of all legend IDs.

##### #legend_info(id)
Returns a hash of information for specified profession(s) with the keys: `:id`, `:swap`, `:heal`, `:elite`, and `:utilities`.

The optional `id` parameter takes:
* a String of ID(s) => `legend_info("Legend2, Legend4")` or `legend_info("Legend2")`
* an Array of IDs => `legend_info(["Legend2", "Legend4"])`

```ruby
legendary_assassin = @client.legend_info("Legend2")
legendary_assassin[:elite]
# Returns the skill ID (28406) to be resolved using #skill_info
```

#### Professions
##### #all_professions
Returns an array of all profession IDs (which are strings).

##### #profession_info
Returns a hash of information for specified profession(s) with the keys: `:id`, `:name`, `:icon`, `:icon_big`, `:specializations`, `:weapons`, and `:training`.

The required `id` parameter takes:
* a String of ID(s)=>  `profession_info("Mesmer, Thief")` or `profession_info("Mesmer")`
* an Array of IDs => `profession_info(["Mesmer", "Thief"])`

```ruby
mesmer_info = @client.profession_info("Mesmer")
mesmer_info[:weapons][:Focus][:skills]
# Returns an array of hashes where each item (hash) in the array represents a weapon skill
```

#### Skills
##### #all_skills
Returns an array of all skill IDs.

##### #skill_info
Returns a hash of information for specified skill(s) with the keys: `:id`, `:name`, `:icon`, `:chat_link`, `:type`, `:weapon_type`, `:professions`, `:slot`, as well as a large number of optional keys. For the complete list, see the [official API documentation for skills endpoint](https://wiki.guildwars2.com/wiki/API:2/skills#Response).

The required `id` parameter takes:
* an Integer => `skill_info(5490)`
* a String of ID number(s) =>  `skill_info("5490,5491,5492")` or `skill_info("5490")`
* an Array of ID numbers => `skill_info([5490,5491,5492])` or `skill_info(["5490", "5491", "5492"])`

```ruby
warrior_skill_info = @client.skill_info(14375)
warrior_skill_info[:name]
# Returns a string with the name of the skill e.g. "Arcing Slice"
```

#### Specializations
##### #all_specializations
Returns an array of all specialization IDs.

##### #specialization_info
Returns a hash of information for specified specialization(s) with the keys: `:id`, `:name`, `:profession`, `:elite`, `:icon`, `:background`, `:minor_traits`, and `:major_traits`.

The required `id` parameter takes:
* an Integer => `specialization_info(1)`
* a String of ID number(s) =>  `specialization_info("1,2,3")` or `specialization_info("1")`
* an Array of ID numbers => `specialization_info([1,2,3])` or `specialization_info(["1", "2", "3"])`

```ruby
dueling_info = @client.specialization_info(1)
dueling_info[:minor_traits]
# Returns an array of integers where each item (integer) in the array represents a trait ID which can be resolved using #trait_info
```

#### Traits
##### #all_traits
Returns an array of all skill IDs.

##### #trait_info
Returns a hash of information for specified skill(s) with the keys: `:id`, `:name`, `:icon`, `:description` `:specialization`, `:tier`, `:slot`, as well as optional `:facts`, `:traited_facts`, and `:skills`.

The required `id` parameter takes:
* an Integer => `trait_info(2058)`
* a String of ID number(s) =>  `trait_info("2056,2057,2058")` or `trait_info("2058")`
* an Array of ID numbers => `trait_info([2056,2057,2058])` or `trait_info(["2056", "2057", "2058"])`

```ruby
lingering_light = @client.trait_info(2058)
lingering_light[:name]
# Returns a string with the name of the trait e.g. "Lingering Light"
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
