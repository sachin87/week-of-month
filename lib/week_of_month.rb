require 'date'
require 'time'
require_relative 'modules/day'
require_relative 'modules/month'
require_relative 'modules/week'

class Date
  include WeekOfMonth::Day
  include WeekOfMonth::Month
  include WeekOfMonth::Week
end

class Time
  include WeekOfMonth::Day
  include WeekOfMonth::Month
  include WeekOfMonth::Week
  
  def leap?
    self.to_date.leap?
  end
end
