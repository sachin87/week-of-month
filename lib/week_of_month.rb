require 'date'
require 'time'
require_relative 'modules/day'
require_relative 'modules/month'
require_relative 'modules/week'
require_relative 'modules/year'

class Date
  include WeekOfMonth::Day
  include WeekOfMonth::Month
  include WeekOfMonth::Week
  include WeekOfMonth::Year
end

class Time
  include WeekOfMonth::Day
  include WeekOfMonth::Month
  include WeekOfMonth::Week
  include WeekOfMonth::Year
  
  def leap?
    self.to_date.leap?
  end
end
