require 'date'
require 'time'

def require_file(file_name)
  RUBY_VERSION < '1.9' ? require(file_name) : require_relative(file_name)
end

require_file 'modules/day'
require_file 'modules/month'
require_file 'modules/week'
require_file 'modules/year'

class Date
  include WeekOfMonth::Day
  include WeekOfMonth::Month
  include WeekOfMonth::Week
  include WeekOfMonth::Year
end

[Time, Date].each do |klass|
  klass.class_eval do
    unless method_defined?(:to_date)
      def to_date
        ::Date.new(year, month, day)
      end
    end

    unless method_defined?(:sunday?)
      def sunday?
        wday == 0
      end

      def monday?
        wday == 1
      end

      def tuesday?
        wday == 2
      end

      def wednesday?
        wday == 3
      end

      def thursday?
        wday == 4
      end

      def friday?
        wday == 5
      end

      def saturday?
        wday == 6
      end
    end
  end
end

class Time
  include WeekOfMonth::Day
  include WeekOfMonth::Month
  include WeekOfMonth::Week
  include WeekOfMonth::Year

  def leap?
    to_date.leap?
  end

  if RUBY_VERSION < '1.9'
    def self.new(year = Time.now.year, month = Time.now.month, day = Time.now.day, hour = Time.now.hour, min = Time.now.min, sec = Time.now.sec, millisecond = (Time.now.to_f * 1000.0).to_i)
      Time.local(year, month, day, hour, min, sec, millisecond)
    end
  end
end

class Hash
  unless method_defined?(:key)
    def key(value)
      result = nil
      each { |k, v| result = k if v == value && result.nil?; } if values.include?(value)
      result
    end
  end
end
