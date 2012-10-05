require 'date'
require 'time'
require 'week_helper' 

class Date
  include WeekHelper
end

class Time
  include WeekHelper
  
  def leap?
    self.to_date.leap?
  end
end
