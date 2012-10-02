#!/bin/env ruby
# encoding: utf-8

require 'test/unit'
require_relative '../week_of_month'

class TestWeekOfMonth < Test::Unit::TestCase
  
  def test_constants_present?
    assert Date::WEEK_IN_ENG
    
    assert Date::WEEK_IN_GER
    
    assert Date::WEEK_IN_FR
    
    assert Date::WEEK_IN_JAP
    
    assert Date::MONTH_WITH_DAY
    
    assert Date::MONTH_WITH_SEQUENCE
  end
  
  def test_constants_value
    assert_equal({ 1 => 'First', 2 => 'Second',
                   3 => 'Third', 4 => 'Fourth',
                   5 => 'Fifth', 6 => 'Sixth' }, Date::WEEK_IN_ENG)
    
    assert_equal({ 1 => 'First', 2 => 'Second',
                   3 => 'Third', 4 => 'Quatrième',
                   5 => 'Cinquième', 6 => 'sixième'}, Date::WEEK_IN_FR)
    
    assert_equal({ 1 => 'First', 2 => 'Second',
                   3 => 'Dritten', 4 => 'Vierte',
                   5 => 'Fünfte', 6 => 'Sechste'}, Date::WEEK_IN_GER)
    
    assert_equal({ 1=>'最初', 2 =>'秒',
                                      3 =>'サード', 4=> '第4回',
                   5 =>'第五',6=> 'シックス' } ,  Date::WEEK_IN_JAP)
    
    assert_equal({ :january => 1, :february => 2, :march => 3, 
                   :april => 4, :may => 5, :june => 6, :july => 7, 
                   :august => 8, :september => 9, :october => 10, 
                   :november => 11, :december => 12 }, Date::MONTH_WITH_SEQUENCE)
    
    assert_equal({ :january => 31, :february => 28, :march => 31, 
                   :april => 30, :may => 31, :june => 30, :july => 31, 
                   :august => 31, :september => 30, :october => 31, 
                   :november => 30, :december => 31 }, Date::MONTH_WITH_DAY)
  end
  
  def test_month?
    assert Date.new(2012,1,1).january?
     
    assert Date.new(2012,2,1).february?
     
    assert Date.new(2012,3,1).march?
     
    assert Date.new(2012,4,1).april?
     
    assert Date.new(2012,5,1).may?
     
    assert Date.new(2012,6,1).june?
     
    assert Date.new(2012,7,1).july?
    
    assert Date.new(2012,8,1).august?
     
    assert Date.new(2012,9,1).september? 
     
    assert Date.new(2012,10,1).october?
     
    assert Date.new(2012,11,1).november?

    assert Date.new(2012,12,1).december?   
  end
   
  def test_week_of_month 
    assert_equal 5, Date.new(2012,1,31).week_of_month
     
    assert_equal 5, Date.new(2012,2,29).week_of_month
     
    assert_equal 5, Date.new(2012,3,31).week_of_month
     
    assert_equal 5, Date.new(2012,4,30).week_of_month
     
    assert_equal 5, Date.new(2012,5,31).week_of_month
     
    assert_equal 5, Date.new(2012,6,30).week_of_month
     
    assert_equal 5, Date.new(2012,7,31).week_of_month
    
    assert_equal 5, Date.new(2012,8,31).week_of_month
     
    assert_equal 6, Date.new(2012,9,30).week_of_month 
     
    assert_equal 5, Date.new(2012,10,31).week_of_month
     
    assert_equal 5, Date.new(2012,11,30).week_of_month

    assert_equal 6, Date.new(2012,12,31).week_of_month
  end

  def test_last_day_of_month
    assert_equal 31, Date.new(2012,1,31).last_day_of_month
     
    assert_equal 29, Date.new(2012,2,29).last_day_of_month
     
    assert_equal 31, Date.new(2012,3,31).last_day_of_month
     
    assert_equal 30, Date.new(2012,4,30).last_day_of_month
     
    assert_equal 31, Date.new(2012,5,31).last_day_of_month
     
    assert_equal 30, Date.new(2012,6,30).last_day_of_month
     
    assert_equal 31, Date.new(2012,7,31).last_day_of_month
    
    assert_equal 31, Date.new(2012,8,31).last_day_of_month
     
    assert_equal 30, Date.new(2012,9,30).last_day_of_month
     
    assert_equal 31, Date.new(2012,10,31).last_day_of_month
     
    assert_equal 30, Date.new(2012,11,30).last_day_of_month

    assert_equal 31, Date.new(2012,12,31).last_day_of_month
  end
  
  def test_end_of_month
    assert_equal Date.new(2012,1,31), Date.new(2012,1,1).end_of_month
     
    assert_equal Date.new(2012,2,29), Date.new(2012,2,2).end_of_month
     
    assert_equal Date.new(2012,3,31), Date.new(2012,3,1).end_of_month
     
    assert_equal Date.new(2012,4,30), Date.new(2012,4,3).end_of_month
     
    assert_equal Date.new(2012,5,31), Date.new(2012,5,1).end_of_month
     
    assert_equal Date.new(2012,6,30), Date.new(2012,6,30).end_of_month
     
    assert_equal Date.new(2012,7,31), Date.new(2012,7,1).end_of_month
    
    assert_equal Date.new(2012,8,31), Date.new(2012,8,5).end_of_month
     
    assert_equal Date.new(2012,9,30), Date.new(2012,9,2).end_of_month
     
    assert_equal Date.new(2012,10,31), Date.new(2012,10,22).end_of_month
     
    assert_equal Date.new(2012,11,30), Date.new(2012,11,10).end_of_month

    assert_equal Date.new(2012,12,31), Date.new(2012,12,15).end_of_month   
  end
  
  def test_beginning_of_month
    assert_equal Date.new(2012,1,1), Date.new(2012,1,31).beginning_of_month
     
    assert_equal Date.new(2012,2,1), Date.new(2012,2,29).beginning_of_month
     
    assert_equal Date.new(2012,3,1), Date.new(2012,3,31).beginning_of_month
     
    assert_equal Date.new(2012,4,1), Date.new(2012,4,30).beginning_of_month
     
    assert_equal Date.new(2012,5,1), Date.new(2012,5,31).beginning_of_month
     
    assert_equal Date.new(2012,6,1), Date.new(2012,6,30).beginning_of_month
     
    assert_equal Date.new(2012,7,1), Date.new(2012,7,31).beginning_of_month
    
    assert_equal Date.new(2012,8,1), Date.new(2012,8,31).beginning_of_month
     
    assert_equal Date.new(2012,9,1), Date.new(2012,9,30).beginning_of_month
     
    assert_equal Date.new(2012,10,1), Date.new(2012,10,31).beginning_of_month
     
    assert_equal Date.new(2012,11,1), Date.new(2012,11,30).beginning_of_month

    assert_equal Date.new(2012,12,1), Date.new(2012,12,31).beginning_of_month
  end
  
  def test_days_array
    date = Date.new(2012,2,8)
    days_array_for_february =  [nil, nil, nil, 1, 2, 3, 4, 5,
                                6, 7, 8, 9, 10, 11, 12, 13, 14, 
                                15, 16, 17, 18, 19, 20, 21, 22, 
                                23, 24, 25, 26, 27, 28, 29]
    assert_kind_of Array,date.days_array
    assert_equal days_array_for_february, date.days_array
    
    date = Date.new(2012,7,1)
    days_array_for_july = [1, 2, 3, 4, 5, 6, 7,
                      8, 9, 10, 11, 12, 13, 
                      14, 15, 16, 17, 18, 19, 
                      20, 21, 22, 23, 24, 25, 
                      26, 27, 28, 29, 30, 31] 
    assert_kind_of Array,date.days_array
    assert_equal days_array_for_july, date.days_array
  end

  def test_week_split
    date = Date.new(2012,1,10)
    split_for_january = [[1, 2, 3, 4, 5, 6, 7],
                         [8, 9, 10, 11, 12, 13, 14], 
                         [15, 16, 17, 18, 19, 20, 21], 
                         [22, 23, 24, 25, 26, 27, 28], 
                         [29, 30, 31]]
    assert_kind_of Array,date.week_split
    assert_equal split_for_january, date.week_split
    
    date = Date.new(2012,10,15)
    split_for_october = [[nil, 1, 2, 3, 4, 5, 6], 
                         [7, 8, 9, 10, 11, 12, 13], 
                         [14, 15, 16, 17, 18, 19, 20], 
                         [21, 22, 23, 24, 25, 26, 27], 
                         [28, 29, 30, 31]]
    assert_kind_of Array,date.week_split
    assert_equal split_for_october, date.week_split 
  end
  
  def test_first_week?
    assert Date.new(2012,1,1).first_week?
    assert !Date.new(2012,1,31).first_week?
  end

  def test_second_week?
    assert Date.new(2012,10,9).second_week?
    assert !Date.new(2012,10,20).second_week?
  end

  def test_last_week?
    assert Date.new(2012,10,31).last_week?
    assert !Date.new(2012,10,20).last_week?  
  end

  def test_total_weeks
    assert_equal 5, Date.new(2012,10,31).total_weeks
    assert_equal 6, Date.new(2012,12,20).total_weeks  
  end

  def test_week_of_month_in_eng
    assert_equal 'First', Date.new(2012,12,1).week_of_month_in_eng
    assert_equal 'Second', Date.new(2012,12,4).week_of_month_in_eng
    assert_equal 'Third', Date.new(2012,12,9).week_of_month_in_eng
    assert_equal 'Fourth', Date.new(2012,12,16).week_of_month_in_eng
    assert_equal 'Fifth', Date.new(2012,12,24).week_of_month_in_eng
    assert_equal 'Sixth', Date.new(2012,12,31).week_of_month_in_eng
  end
  
  def test_week_of_month_in_fr
    assert_equal 'First', Date.new(2012,12,1).week_of_month_in_fr
    assert_equal 'Second', Date.new(2012,12,4).week_of_month_in_fr
    assert_equal 'Third', Date.new(2012,12,9).week_of_month_in_fr
    assert_equal 'Quatrième', Date.new(2012,12,16).week_of_month_in_fr
    assert_equal 'Cinquième', Date.new(2012,12,24).week_of_month_in_fr
    assert_equal 'sixième', Date.new(2012,12,31).week_of_month_in_fr    
  end
  
  def test_week_of_month_in_ger
    assert_equal 'First', Date.new(2012,12,1).week_of_month_in_ger
    assert_equal 'Second', Date.new(2012,12,4).week_of_month_in_ger
    assert_equal 'Dritten', Date.new(2012,12,9).week_of_month_in_ger
    assert_equal 'Vierte', Date.new(2012,12,16).week_of_month_in_ger
    assert_equal 'Fünfte', Date.new(2012,12,24).week_of_month_in_ger
    assert_equal 'Sechste', Date.new(2012,12,31).week_of_month_in_ger
  end
  
  def test_week_of_month_in_jap
    assert_equal '最初', Date.new(2012,12,1).week_of_month_in_jap
    assert_equal '秒', Date.new(2012,12,4).week_of_month_in_jap
    assert_equal 'サード', Date.new(2012,12,9).week_of_month_in_jap
    assert_equal '第4回', Date.new(2012,12,16).week_of_month_in_jap
    assert_equal '第五', Date.new(2012,12,24).week_of_month_in_jap
    assert_equal 'シックス',  Date.new(2012,12,31).week_of_month_in_jap    
  end
  
  def test_name_of_week_day
    assert_equal "Saturday",  Date.new(2012,12,1).name_of_week_day
    assert_equal "Sunday",  Date.new(2012,12,2).name_of_week_day
    assert_equal "Monday",  Date.new(2012,12,3).name_of_week_day
    assert_equal "Tuesday",  Date.new(2012,12,4).name_of_week_day
    assert_equal "Wednesday",  Date.new(2012,12,5).name_of_week_day
    assert_equal "Thursday",  Date.new(2012,12,6).name_of_week_day
    assert_equal "Friday",  Date.new(2012,12,7).name_of_week_day
  end
  
  def test_name_of_month
    assert_equal "January",  Date.new(2012,1,1).name_of_month
    assert_equal "February",  Date.new(2012,2,1).name_of_month
    assert_equal "March",  Date.new(2012,3,1).name_of_month
    assert_equal "April",  Date.new(2012,4,1).name_of_month
    assert_equal "May",  Date.new(2012,5,1).name_of_month
    assert_equal "June",  Date.new(2012,6,1).name_of_month
    assert_equal "July",  Date.new(2012,7,1).name_of_month
    assert_equal "August",  Date.new(2012,8,1).name_of_month
    assert_equal "September",  Date.new(2012,9,1).name_of_month
    assert_equal "October",  Date.new(2012,10,1).name_of_month
    assert_equal "November",  Date.new(2012,11,1).name_of_month
    assert_equal "December",  Date.new(2012,12,1).name_of_month
  end
  
end
