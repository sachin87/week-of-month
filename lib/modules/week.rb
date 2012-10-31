# @author Sachion Singh 

require_relative 'constant'

module WeekOfMonth
  module Week

    include WeekOfMonth::Constant
    
    # returns week of month for a given date
    # Date.new(2012,11,15).week_of_month
    #   => 3
    # @return [Fixnum]
    def week_of_month
      week_split.each_with_index do |o,i|
        return (i + 1) if o.include?(self.day)
      end
    end
    
    # checks whether the given day lies in first week of month
    # Date.new(2012,11,1).first_week?
    #   => true
    # @return [Boolean]
    def first_week?
      week_split[0].include?((self.day))
    end
    
    # checks whether the given day lies in second week of month
    # Date.new(2012,11,8).second_week?
    #   => true
    # @return [Boolean]
    def second_week?
      week_split[1].include?((self.day))
    end

    # checks whether the given day lies in last week of month
    # Date.new(2012,11,8).last_week?
    #   => false
    # @return [Boolean]
    def last_week?
      week_split.last.include?((self.day))
    end

    # returns total number of weeks in month
    # Date.new(2012,11,8).total_weeks
    #   => 5
    # @return [Fixnum]
    def total_weeks
      week_split.size
    end

    # checks whether the given day is saturday or sunday.
    # Date.new(2012,11,8).week_end?
    #   => false
    # @return [Boolean]
    def week_end?
      saturday? || sunday?
    end

    # checks whether the given day is not saturday or sunday.
    # Date.new(2012,11,8).working_day?
    #   => true
    # @return [Boolean]
    def working_day?
      !week_end?
    end

    # returns week split of the month for the given date
    # example-
    # Date.new(2012,1,1).week_split
    #   => [[1, 2, 3, 4, 5, 6, 7],
    #       [8, 9, 10, 11, 12, 13, 14], 
    #       [15, 16, 17, 18, 19, 20, 21], 
    #       [22, 23, 24, 25, 26, 27, 28], 
    #       [29, 30, 31]
    # @return [Array] 
    def week_split
      days_array.each_slice(7).to_a
    end

    # this code generates method like 'week_of_month_eng', 'week_of_month_fr' etc.
    # Date.new(2012,11,15).week_of_month_in_eng
    #   => 'Third'
    # Date.new(2012,11,30).week_of_month_in_fr
    #   => "Cinquième"
    # @return [String] 
    ['eng', 'fr', 'ger', 'jap'].each do |lang|
      method_name = "week_of_month_in_#{lang}"
      define_method(method_name) do
        eval "WEEK_IN_#{lang.upcase}[week_of_month]"
      end
    end
    
    def weeks_between_dates(date)
      (self.week_of_month - date.week_of_month).abs
    end
    
    def days_past_in_week
      self.week_of_month
    end
    
    def days_left_in_week
      7 - days_past_in_week
    end
    
    def beginning_of_week
      
    end
    
    def end_of_week
      
    end
    
  end
end