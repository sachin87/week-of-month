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

  MONTH_WITH_DAY = { :january => 31, :february => 28, :march => 31, 
                     :april => 30, :may => 31, :june => 30, :july => 31, 
                     :august => 31, :september => 30, :october => 31, 
                     :november => 30, :december => 31 }
                   
  MONTH_WITH_SEQUENCE = { :january => 1, :february => 2, :march => 3, 
                          :april => 4, :may => 5, :june => 6, :july => 7, 
                          :august => 8, :september => 9, :october => 10, 
                          :november => 11, :december => 12 }
    
   MONTH_WITH_DAY.keys.each do |month_name|
     define_method((month_name.to_s + '?').to_sym) do      
       MONTH_WITH_SEQUENCE[month_name] == month      
     end
   end
   
   def last_day_of_month
     if leap? && february?
       29
     else
       MONTH_WITH_DAY[MONTH_WITH_SEQUENCE.key(month)]
     end 
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

end
