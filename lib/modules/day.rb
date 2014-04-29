#!/bin/env ruby
# encoding: utf-8

# @author Sachin Singh

module WeekOfMonth
  module Day

    # gives array of days in month
    # Date.new(2012,1,1).days_array
    #   => [ 1, 2, 3, 4, 5, 6, 7, 8, 9,
    #        10, 11, 12, 13, 14, 15, 16,
    #        17, 18, 19, 20, 21, 22, 23,
    #        24, 25, 26, 27, 28, 29, 30,
    #        31]
    # @return [Array]
    def days_array
      day = self.beginning_of_month.to_date.wday
      array = []
      array[day] = 1
      (2..self.end_of_month.mday).each {|i| array << i }
      array
    end

    # Date.new(2012,11,1).name_of_week_day
    #   => 'Thursday'
    # @return [String]
    def name_of_week_day
      self.class.new(year,month,day).strftime('%A')
    end
      
    # this code generates method names like 'upcoming_monday' and 'previous_monday'
    # Date.new(2013,1,1).upcoming_monday
    # => #<Date: 2013-01-07 ((2456300j,0s,0n),+0s,2299161j)>
    # Date.new(2013,1,1).previous_monday
    # => #<Date: 2012-12-31 ((2456293j,0s,0n),+0s,2299161j)>
    { 'upcoming' => '+', 'previous' => '-' }.each_pair do |key,value|
      Date::DAYNAMES.each do |day_name|
        name = "#{key}_#{day_name.downcase}".to_sym
        check = "#{day_name.downcase}?".to_sym
        define_method(name) do
          date = eval "self"
          if date.send(check)
            if date.class == Date
              date = date.send(value,7) 
            elsif date.class == Time
              date = date.send(value,(60 * 60 * 24 * 7))
            end
           else
             until date.send(check)
               if date.class == Date
                 date = date.send(value,1) 
               elsif date.class == Time
                 date = date.send(value,(60 * 60 * 24))
               end
             end
           end
           date
        end
      end
    end
   
  end
end
