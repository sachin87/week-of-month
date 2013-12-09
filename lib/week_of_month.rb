require 'date'
require 'time'

RUBY_VERSION < '1.9' ? require('modules/day')   : require_relative('modules/day')
RUBY_VERSION < '1.9' ? require('modules/month') : require_relative('modules/month')
RUBY_VERSION < '1.9' ? require('modules/week')  : require_relative('modules/week')
RUBY_VERSION < '1.9' ? require('modules/year')  : require_relative('modules/year')

class Date
  include WeekOfMonth::Day
  include WeekOfMonth::Month
  include WeekOfMonth::Week
  include WeekOfMonth::Year

  unless method_defined?(:to_date)
    def to_date
      ::Date.new(year, month, day)
    end
  end

  unless method_defined?(:sunday?)
    def sunday?    ; self.wday == 0; end
    def monday?    ; self.wday == 1; end
    def tuesday?   ; self.wday == 2; end
    def wednesday? ; self.wday == 3; end
    def thursday?  ; self.wday == 4; end
    def friday?    ; self.wday == 5; end
    def saturday?  ; self.wday == 6; end
  end
end

class Time
  include WeekOfMonth::Day
  include WeekOfMonth::Month
  include WeekOfMonth::Week
  include WeekOfMonth::Year
  
  def leap?
    self.to_date.leap?
  end

  if RUBY_VERSION < '1.9'
    def self.new(year=Time.now.year, month=Time.now.month, day=Time.now.day, hour=Time.now.hour, min=Time.now.min, sec=Time.now.sec, millisecond=(Time.now.to_f * 1000.0).to_i)
      Time.local(year, month, day, hour, min, sec, millisecond)
    end
  end

  unless method_defined?(:to_date)
    def to_date
      ::Date.new(year, month, day)
    end
  end
  unless method_defined?(:sunday?)
    def sunday?    ; self.wday == 0; end
    def monday?    ; self.wday == 1; end
    def tuesday?   ; self.wday == 2; end
    def wednesday? ; self.wday == 3; end
    def thursday?  ; self.wday == 4; end
    def friday?    ; self.wday == 5; end
    def saturday?  ; self.wday == 6; end
  end
end

class Hash
  unless method_defined?(:key)
    def key(value)
      result = nil
      self.each do |k,v| result = k if v == value && result == nil; end if self.values.include?(value)
      result
    end
  end
end

