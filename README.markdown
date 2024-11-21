
# m2m_fast_insert

[![TravisCI](https://secure.travis-ci.org/sportngin/m2m_fast_insert.png "TravisCI")](http://travis-ci.org/sportngin/m2m_fast_insert "Travis-CI m2m_fast_insert")
[![Code Climate](https://codeclimate.com/github/sportngin/m2m_fast_insert/badges/gpa.svg)](https://codeclimate.com/github/sportngin/m2m_fast_insert)
[![Gem Version](https://badge.fury.io/rb/m2m_fast_insert.svg)](https://rubygems.org/gems/m2m_fast_insert)

# Why

When doing a mass ID insert on a simple HABTM join table, Rails will load the entire records of all the IDs
you're inserting. That seemed silly to me, since that's not running validations. Its also disgustingly slow
if you're inserting, say, 10,000 records.

This Gem solves that issue for now. I didn't want to override the insertion method, so I added
`#fast_<relation_name>_ids_insert` to force a bare SQL call that just drops all of the IDs in without all
of the overhead of loading their objects.

# Usage

```ruby
class User < ActiveRecord::Base
  has_and_belongs_to_many :posts
  
  def self.first_and_insert # as an example
    User.first.fast_post_ids_insert [1,2,3,4,5,6,7,8,9,10] # This is the actual call
  end
  
  def insert_lots_of_posts # as an example
    fast_post_ids_insert [1,2,3,4,5,6,7,8,9,10] # This is the actual call
  end
end
```

This project rocks and uses MIT-LICENSE.

# TODO

* Allow options for how hard to fail with missing ID or ID params
* Fall back to the rails-y insert on an empty ID?
