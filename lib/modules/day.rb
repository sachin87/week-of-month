#!/bin/env ruby
# encoding: utf-8

# @author Sachin Singh

module WeekOfMonth

  attr_accessor :config

  def initialize(config = Configuration.new)
    @config = config
  end

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
      if WeekOfMonth.configuration.monday_active == true
        day = day.zero? ? 6 : day - 1
      end
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

    # this code generates methods with names like 'upcoming_monday' and 'previous_monday'
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

    # gives last working/business day of the month
    # Date.new(2014,12,1).last_business_day_of_month
    # => #<Date: 2014-12-31 ((2457023j,0s,0n),+0s,2299161j)>
    def last_business_day_of_month
      all_working_days_of_month.first
    end

    # returns array of all working days of the month
    # Date.new(2014,12,1).all_working_days_of_month
    # => [#<Date: 2014-12-31 ((2457023j,0s,0n),+0s,2299161j)>, #<Date: 2014-12-30 ((2457022j,0s,0n),+0s,2299161j)>,
      # #<Date: 2014-12-29 ((2457021j,0s,0n),+0s,2299161j)>, #<Date: 2014-12-26 ((2457018j,0s,0n),+0s,2299161j)>,
      # #<Date: 2014-12-25 ((2457017j,0s,0n),+0s,2299161j)>, #<Date: 2014-12-24 ((2457016j,0s,0n),+0s,2299161j)>,
      # #<Date: 2014-12-23 ((2457015j,0s,0n),+0s,2299161j)>, #<Date: 2014-12-22 ((2457014j,0s,0n),+0s,2299161j)>,
      # #<Date: 2014-12-19 ((2457011j,0s,0n),+0s,2299161j)>, #<Date: 2014-12-18 ((2457010j,0s,0n),+0s,2299161j)>,
      # #<Date: 2014-12-17 ((2457009j,0s,0n),+0s,2299161j)>, #<Date: 2014-12-16 ((2457008j,0s,0n),+0s,2299161j)>,
      # #<Date: 2014-12-15 ((2457007j,0s,0n),+0s,2299161j)>, #<Date: 2014-12-12 ((2457004j,0s,0n),+0s,2299161j)>,
      # #<Date: 2014-12-11 ((2457003j,0s,0n),+0s,2299161j)>, #<Date: 2014-12-10 ((2457002j,0s,0n),+0s,2299161j)>,
      # #<Date: 2014-12-09 ((2457001j,0s,0n),+0s,2299161j)>, #<Date: 2014-12-08 ((2457000j,0s,0n),+0s,2299161j)>,
      # #<Date: 2014-12-05 ((2456997j,0s,0n),+0s,2299161j)>, #<Date: 2014-12-04 ((2456996j,0s,0n),+0s,2299161j)>,
      # #<Date: 2014-12-03 ((2456995j,0s,0n),+0s,2299161j)>, #<Date: 2014-12-02 ((2456994j,0s,0n),+0s,2299161j)>,
      # #<Date: 2014-12-01 ((2456993j,0s,0n),+0s,2299161j)>]
    def all_working_days_of_month
      self.end_of_month.downto(beginning_of_month).select{|day| day.working_day? }
    end

    # returns array of all non working days of the month
    # Date.new(2014,12,1).all_non_week_days_of_month
    # => [#<Date: 2014-12-28 ((2457020j,0s,0n),+0s,2299161j)>, #<Date: 2014-12-27 ((2457019j,0s,0n),+0s,2299161j)>,
      # #<Date: 2014-12-21 ((2457013j,0s,0n),+0s,2299161j)>, #<Date: 2014-12-20 ((2457012j,0s,0n),+0s,2299161j)>,
      # #<Date: 2014-12-14 ((2457006j,0s,0n),+0s,2299161j)>, #<Date: 2014-12-13 ((2457005j,0s,0n),+0s,2299161j)>,
      # #<Date: 2014-12-07 ((2456999j,0s,0n),+0s,2299161j)>, #<Date: 2014-12-06 ((2456998j,0s,0n),+0s,2299161j)>]
    def all_non_week_days_of_month
      self.end_of_month.downto(beginning_of_month).select{|day| day.week_end? }
    end

    # returns first working/business day of the month
    # Date.new(2014,12,1).first_working_day_of_the_month
    # => #<Date: 2014-12-01 ((2456993j,0s,0n),+0s,2299161j)>
    def first_working_day_of_the_month
      self.beginning_of_month.upto(end_of_month).find{|day| day.working_day? }
    end

  end
end
