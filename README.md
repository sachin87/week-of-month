# Week of month

[![Gem Version](https://badge.fury.io/rb/week_of_month.svg)][gem]
[![Climate](https://codeclimate.com/github/sachin87/week-of-month.png)][climate]
[![License](http://img.shields.io/license/MIT.png?color=green)][license]

[gem]: http://badge.fury.io/rb/week_of_month
[climate]: https://codeclimate.com/github/sachin87/week-of-month
[license]: http://opensource.org/licenses/MIT

Week of month is a gem which extends Date and Time class with useful methods. Among accurately displaying the days of a week in the form of a calendar arrangement, this gem will also provide you with tools for identifying which week of the month a particular date lies.

## Getting Started

Week of month is released as a Ruby Gem. The gem is to be installed within a Ruby
on Rails application. To install, simply add the following to your Gemfile:

```ruby
gem 'week_of_month'
```

Run bundle install and don't forget to restart your server after it.

You can also install this gem from the command line as:

```ruby
gem install 'week_of_month'
```
## New! Configure week start day!

include this line inside your application.rb:

```ruby
WeekOfMonth.configuration.monday_active = true
```
This will do all manipulations considering monday as first day of week.

## Usage

**Return the days of the month as if they were displayed on a calendar. In this example, the first day of January starts on a Sunday. Note the format is always (year, month, day)**

```ruby
Date.new(2012,1,1).week_split

=begin
    [[1, 2, 3, 4, 5, 6, 7],
    [8, 9, 10, 11, 12, 13, 14],
    [15, 16, 17, 18, 19, 20, 21],
    [22, 23, 24, 25, 26, 27, 28],
    [29, 30, 31]]
=end
```
**Return the total number of weeks in a month.**

```ruby
Date.new(2012,1,31).total_weeks
# => 5
```

**Return what number week in the month a specific date lies. Can also return the number in english.**

```ruby
Date.new(2012,1,31).week_of_month
# => 5

Date.new(2012,1,31).week_of_month_in_eng
# => "Fifth"
```

**Return true if date lies in first week of month, otherwise false will be returned. Also works with second week and last week.**

```ruby
Date.new(2012,1,1).first_week?
# => true

Date.new(2012,1,9).second_week?
# => true

Date.new(2012,1,31).last_week?
# => true
```

**Returns the month for the specified date.**

```ruby
Date.new(2012,1,1).name_of_month
# => "January"
```

**Return true if date lies in the month of which the method is called, otherwise false will be returned (works for all months).**

```ruby
Date.new(2012,1,1).january?
# => true

Date.new(2012,1,9).august?
# => false

Date.new(2012,12,25).december?
# => true
```

**Return the number of days in a given month (regardless of selected day).**

```ruby
Date.new(2012,1,1).last_day_of_month
# => 31

Date.new(2012,2,9).last_day_of_month
# => 29
```

**Return the dates for which the day of the method falls (works for all days).**

```ruby
Date.new(2012,1,1).all_mondays_in_month
# => [2, 9, 16, 23, 30]
```

**Return the day of the week for the specified date.**

```ruby
Date.new(2012,1,1).name_of_week_day
# => "Sunday"
```

**Returns true if date falls on Monday through Friday, else returns false.**

```ruby
Date.new(2012,1,1).working_day?
# => false

Date.new(2012,2,3).working_day?
# => true
```

**Returns true if date falls on Saturday or Sunday, else returns false.**

```ruby
Date.new(2012,1,1).week_end?
# => true

Date.new(2012,2,3).week_end?
# => false
```





## Tools Being Used

We believe strongly in not writing code unless we have to, so Week of month is built using:

* Ruby Date Class

* Ruby Time Class

## Version History

###1.2.1

Support for Time class

**Methods Added:**

name_of_week_day, name_of_month, week_end?, working_day?,
all_sundays_in_month, all_mondays_in_month, all_tuesdays_in_month,
all_wednesdays_in_month, all_thursdays_in_month, all_fridays_in_month,
all_saturdays_in_month

###1.1.0

ActiveSupport Dependency removed

**Methods Added:**

january?, february?, march?, april?, may?, june?, july?,
august?, september?, october?, november?, december?, last_day_of_month

## Contributing to Week of month

Fork, fix, then send me a pull request,
and most important add yourself to list of authors in gemspec file.

## License

MIT
