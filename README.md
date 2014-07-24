# Week of month

{<img src="https://badge.fury.io/rb/week_of_month.svg" alt="Gem Version" />}[http://badge.fury.io/rb/week_of_month]
{<img src="https://codeclimate.com/github/sachin87/week-of-month.png" />}[https://codeclimate.com/github/sachin87/week-of-month]
(http://img.shields.io/license/MIT.png?color=green)[license]

[gem]:
[climate]: 
[license]: http://opensource.org/licenses/MI

Week of month is a library which gives you week_of_month method on Date and Time
class object, that returns week of the month. It basically extends the Date and Time
class with several useful date helpers.

## Assumption

Sunday is the first day of week.

## Getting Started

Week of month is released as a Ruby Gem. The gem is to be installed within a Ruby
or Rails application. To install, simply add the following to your Gemfile:

```ruby
gem 'week_of_month'
```

Run bundle install and don't forget to restart your server after you install a new gem.

## Usage

**Return the days of the month in concatted arrays as if they were displayed on a calendar. In this example, the first day of January starts on a Sunday. Note the format is (year, month, day)**

```ruby
Date.new(2012,1,1).week_split

///
    [[1, 2, 3, 4, 5, 6, 7],
	[8, 9, 10, 11, 12, 13, 14], 
	[15, 16, 17, 18, 19, 20, 21], 
	[22, 23, 24, 25, 26, 27, 28], 
	[29, 30, 31]]
///
```
**Return the total number of weeks in a month.**

```ruby
Date.new(2012,1,31).total_weeks
# => 5 
```

**Return what number week in the month a specific date lies. Note, format is still (year, month, day)**

```ruby
Date.new(2012,1,20).week_of_month 
# => 3
```

**Return the month's week in which the date lies in english.**

```ruby
Date.new(2012,1,31).week_of_month_in_eng
# => "Fifth" 
```

**It will return true if date lies in first week of month, otherwise false will be returned.**

```ruby
Date.new(2012,1,1).first_week?
# => true 
```

**Similarly, it will return true if date lies in second week of month, otherwise false will be returned.**
```ruby
Date.new(2012,1,9).second_week?
# => true 
```

**It will return true if the date lies in last week of month, otherwise false will be returned.**
```ruby
Date.new(2012,1,31).last_week? 
# => true
```

## Tools Being Used

We believe strongly in not writing code unless we have to, so Week of month is built using

Ruby Date Class

Ruby Time Class

## Version History

1.2.1

Support for Time class

Methods Added

name_of_week_day, name_of_month, week_end?, working_day?,
all_sundays_in_month, all_mondays_in_month, all_tuesdays_in_month,
all_wednesdays_in_month, all_thursdays_in_month, all_fridays_in_month,
all_saturdays_in_month

1.1.0

ActiveSupport Dependency removed

Methods Added

january?, february?, march?, april?, may?, june?, july?,
august?, september?, october?, november?, december?, last_day_of_month

## Contributing to Week of month

Fork, fix, then send me a pull request.

## License

MIT
