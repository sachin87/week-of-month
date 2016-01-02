require 'date'
require 'time'

# Supports both version of ruby 1.8 and 1.9 for loading a file.
def require_file(file_name)
  RUBY_VERSION < '1.9' ? require(file_name) : require_relative(file_name)
end

require_file 'modules/configuration'
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

    # these methods are already defined in ruby 1.9 and above
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

module WeekOfMonth
  class << self
    # A WeekOfMonth configuration object. Must act like a hash
    # See WeekOfMonth::Configuration.
    attr_writer :configuration
  end

  def self.first_day=(val)
    @first_day = DAYS_IN_SEQUENCE[val]
  end

  def self.first_day
    @first_day ||= 0
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configuration=(config)
    @configuration = config
  end

  def self.configure
    yield configuration
  end
end

