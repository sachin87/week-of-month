# @author Sachion Singh 

RUBY_VERSION < '1.9' ? require('modules/constant') : require_relative('constant')

module WeekOfMonth
  module Month

    include WeekOfMonth::Constant

    # this code generates method named like january?..december?
    # to check whether a month is january or march? etc.
    # @return [Boolean]
    MONTH_WITH_DAY.keys.each do |month_name|
      define_method((month_name.to_s + '?').to_sym) do
        MONTH_WITH_SEQUENCE[month_name] == month
      end
    end
    
    # returns day of last day of month for a given date.
    # Date.new(2012,11,1).last_day_of_month
    #   => 30
    # @return [Fixnum]
    def last_day_of_month
      if leap? && february?
        29
      else
        MONTH_WITH_DAY[MONTH_WITH_SEQUENCE.key(month)]
      end
    end

    # returns date of last day of month for a given date.
    # Date.new(2012,11,1).end_of_month
    #   => #<Date: 2012-11-30 ((2456262j,0s,0n),+0s,2299161j)>
    # @return [Date]
    def end_of_month
      self.class.new(year,month,last_day_of_month)
    end

    # returns date of first day of month for a given date.    
    # Date.new(2012,11,1).beginning_of_month
    #   => #<Date: 2012-11-01 ((2456233j,0s,0n),+0s,2299161j)>
    # @return [Date]
    def beginning_of_month
      self.class.new(year,month,1)
    end

    # returns name of month for a given date.    
    # Date.new(2012,11,1).name_of_month
    #   => "November"
    # @return [String]
    def name_of_month
      self.class.new(year,month,day).strftime('%B')
    end

    # this code generates method named like 'all_mondays_in_month',
    # 'all_tuesdays_in_month' etc. for all seven days of week
    # Date.new(2012,11,1).all_mondays_in_month
    #   => [5, 12, 19, 26]
    # @return [Array]
    DAYS_IN_SEQUENCE.each_with_index do |day_name, i|
      method_name = "all_#{day_name.downcase}s_in_month".to_sym
      define_method(method_name) do
        week_split.map{|d| d[i] }.compact
      end
    end
    
    # this code generates method named like 'first_monday_in_month',
    # 'second_tuesday_in_month', 'last_friday_in_month' etc. for 
    # first, second, third, fourth and last seven days of week
    # Date.new(2014,11).third_saturday_in_month
    #   => #<Date: 2014-11-15>
    # @return [Date]
    DAYS_IN_SEQUENCE.each_with_index do |day_name, i|
      WEEKS_IN_SEQUENCE.each.with_index(-1) do |week_number, j|
        method_name = "#{week_number.downcase}_#{day_name.downcase}_in_month".to_sym
        define_method(method_name) do
          self.class.new(year, month, week_split.map{|d| d[i] }.compact[j])
        end
      end
    end
  end
end