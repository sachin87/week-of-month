#!/bin/env ruby
# encoding: utf-8

require 'date'

class Date

  WEEK_IN_ENG = { 1 => 'First', 2 => 'Second',
                  3 => 'Third', 4 => 'Fourth',
                  5 => 'Fifth', 6 => 'Sixth' }

  WEEK_IN_FR = { 1 => 'First', 2 => 'Second',
                 3 => 'Third', 4 => 'Quatrième',
                 5 => 'Cinquième', 6 => 'sixième'}
   
  WEEK_IN_GER = { 1 => 'First', 2 => 'Second',
                  3 => 'Dritten', 4 => 'Vierte',
                  5 => 'Fünfte', 6 => 'Sechste'}

  WEEK_IN_JAP = { 1=>'最初', 2 =>'秒',
                                    3 =>'サード', 4=> '第4回',
                  5 =>'第五',6=> 'シックス' }

 
  GENERAL_YEAR = { "January" => 31, "February" => 28, "March" => 31, 
                   "April" => 30, "May" => 31, "June" => 30, "July" => 31, 
                   "August" => 31, "September" => 30, "October" => 31, 
                   "November" => 30, "December" => 31 }
                   
   LEAP_YEAR =   { "January" => 31, "February" => 28, "March" => 31, 
                   "April" => 30, "May" => 31, "June" => 30, "July" => 31, 
                   "August" => 31, "September" => 30, "October" => 31, 
                   "November" => 30, "December" => 31 }
    
  def last_day_of_month
    if january?
       31
    elsif february?
      if leap?
        29
      else
        28
      end
    elsif march?
      31
    elsif april?
      30
    elsif may?
      31
    elsif june?
      30
    elsif july?
      31
    elsif august?
      31
    elsif september?
      30
    elsif october?
      31
    elsif november?
      30
    elsif december?
      31
    end
  end       

  def january?
    month == 1
  end
  
  def february?
    month == 2
  end
  
  def march?
    month == 3
  end
  
  def april?
    month == 4
  end
  
  def may?
     month == 5
  end
  
  def june?
    month == 6  
  end
  
  def july?
    month == 7
  end
  
  def august?
    month == 8  
  end
  
  def september?
    month == 9
  end
  
  def october?
    month == 10
  end
  
  def november?
    month == 11
  end
  
  def december?
    month == 12
  end

  def sunday?
    Date.new(year,month,day).wday == 0
  end

  def monday?
    Date.new(year,month,day).wday == 1
  end

  def tuesday?
    Date.new(year,month,day).wday == 2
  end

  def wednesday?
    Date.new(year,month,day).wday == 3
  end

  def thursday?
    Date.new(year,month,day).wday == 4
  end

  def friday?
    Date.new(year,month,day).wday == 5
  end

  def saturday?
    Date.new(year,month,day).wday == 6
  end
  
  def end_of_month
    Date.new(year,month,last_day_of_month)
  end
  
  def beginning_of_month
    Date.new(year,month,1)
  end

  def days_array
    day = self.beginning_of_month.wday
    array = []
    array[day] = 1
    (2..self.end_of_month.mday).each {|i| array << i }
    array
  end

  def week_split
    days_array.each_slice(7).to_a
  end
  
  def week_of_month
    week_split.each_with_index do |o,i| 
      return (i + 1) if o.include?(self.day)
    end
  end

  def first_week?
    week_split[0].include?((self.day))
  end

  def second_week?
    week_split[1].include?((self.day))
  end

  def last_week?
    week_split.last.include?((self.day))
  end

  def total_weeks
    week_split.size
  end

  def week_of_month_in_eng
    WEEK_IN_ENG[week_of_month]
  end

  def week_of_month_in_fr
    WEEK_IN_FR[week_of_month]
  end

  def week_of_month_in_ger
    WEEK_IN_GER[week_of_month]
  end

  def week_of_month_in_jap
    WEEK_IN_JAP[week_of_month]
  end

  def name_of_week_day
    Date.new(year,month,day).strftime('%A')
  end

  def name_of_month
    Date.new(year,month,day).strftime('%B')
  end  

  def leap_year?
    year%4 == 0
  end  

end
