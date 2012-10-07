#!/bin/env ruby
# encoding: utf-8

require 'test/unit'
require_relative '../week_of_month'

class TestWeekOfMonthForTimeObject < Test::Unit::TestCase
  
  def test_constants_present?
    assert Time::WEEK_IN_ENG
    
    assert Time::WEEK_IN_GER
    
    assert Time::WEEK_IN_FR
    
    assert Time::WEEK_IN_JAP
    
    assert Time::MONTH_WITH_DAY
    
    assert Time::MONTH_WITH_SEQUENCE
  end
  
  def test_constants_value
    assert_equal({ 1 => 'First', 2 => 'Second',
                   3 => 'Third', 4 => 'Fourth',
                   5 => 'Fifth', 6 => 'Sixth' }, Time::WEEK_IN_ENG)
    
    assert_equal({ 1 => 'First', 2 => 'Second',
                   3 => 'Third', 4 => 'Quatrième',
                   5 => 'Cinquième', 6 => 'sixième'}, Time::WEEK_IN_FR)
    
    assert_equal({ 1 => 'First', 2 => 'Second',
                   3 => 'Dritten', 4 => 'Vierte',
                   5 => 'Fünfte', 6 => 'Sechste'}, Time::WEEK_IN_GER)
    
    assert_equal({ 1=>'最初', 2 =>'秒',
                                      3 =>'サード', 4=> '第4回',
                   5 =>'第五',6=> 'シックス' } ,  Time::WEEK_IN_JAP)
    
    assert_equal({ :january => 1, :february => 2, :march => 3, 
                   :april => 4, :may => 5, :june => 6, :july => 7, 
                   :august => 8, :september => 9, :october => 10, 
                   :november => 11, :december => 12 }, Time::MONTH_WITH_SEQUENCE)
    
    assert_equal({ :january => 31, :february => 28, :march => 31, 
                   :april => 30, :may => 31, :june => 30, :july => 31, 
                   :august => 31, :september => 30, :october => 31, 
                   :november => 30, :december => 31 }, Time::MONTH_WITH_DAY)
  end
  
  def test_month?
    assert Time.new(2012,1,1).january?
     
    assert Time.new(2012,2,1).february?
     
    assert Time.new(2012,3,1).march?
     
    assert Time.new(2012,4,1).april?
     
    assert Time.new(2012,5,1).may?
     
    assert Time.new(2012,6,1).june?
     
    assert Time.new(2012,7,1).july?
    
    assert Time.new(2012,8,1).august?
     
    assert Time.new(2012,9,1).september? 
     
    assert Time.new(2012,10,1).october?
     
    assert Time.new(2012,11,1).november?

    assert Time.new(2012,12,1).december?   
  end
   
  def test_week_of_month 
    assert_equal 5, Time.new(2012,1,31).week_of_month
     
    assert_equal 5, Time.new(2012,2,29).week_of_month
     
    assert_equal 5, Time.new(2012,3,31).week_of_month
     
    assert_equal 5, Time.new(2012,4,30).week_of_month
     
    assert_equal 5, Time.new(2012,5,31).week_of_month
     
    assert_equal 5, Time.new(2012,6,30).week_of_month
     
    assert_equal 5, Time.new(2012,7,31).week_of_month
    
    assert_equal 5, Time.new(2012,8,31).week_of_month
     
    assert_equal 6, Time.new(2012,9,30).week_of_month 
     
    assert_equal 5, Time.new(2012,10,31).week_of_month
     
    assert_equal 5, Time.new(2012,11,30).week_of_month

    assert_equal 6, Time.new(2012,12,31).week_of_month
  end

  def test_last_day_of_month
    assert_equal 31, Time.new(2012,1,31).last_day_of_month
     
    assert_equal 29, Time.new(2012,2,29).last_day_of_month
     
    assert_equal 31, Time.new(2012,3,31).last_day_of_month
     
    assert_equal 30, Time.new(2012,4,30).last_day_of_month
     
    assert_equal 31, Time.new(2012,5,31).last_day_of_month
     
    assert_equal 30, Time.new(2012,6,30).last_day_of_month
     
    assert_equal 31, Time.new(2012,7,31).last_day_of_month
    
    assert_equal 31, Time.new(2012,8,31).last_day_of_month
     
    assert_equal 30, Time.new(2012,9,30).last_day_of_month
     
    assert_equal 31, Time.new(2012,10,31).last_day_of_month
     
    assert_equal 30, Time.new(2012,11,30).last_day_of_month

    assert_equal 31, Time.new(2012,12,31).last_day_of_month
  end
  
  def test_end_of_month
    assert_equal Time.new(2012,1,31), Time.new(2012,1,1).end_of_month
     
    assert_equal Time.new(2012,2,29), Time.new(2012,2,2).end_of_month
     
    assert_equal Time.new(2012,3,31), Time.new(2012,3,1).end_of_month
     
    assert_equal Time.new(2012,4,30), Time.new(2012,4,3).end_of_month
     
    assert_equal Time.new(2012,5,31), Time.new(2012,5,1).end_of_month
     
    assert_equal Time.new(2012,6,30), Time.new(2012,6,30).end_of_month
     
    assert_equal Time.new(2012,7,31), Time.new(2012,7,1).end_of_month
    
    assert_equal Time.new(2012,8,31), Time.new(2012,8,5).end_of_month
     
    assert_equal Time.new(2012,9,30), Time.new(2012,9,2).end_of_month
     
    assert_equal Time.new(2012,10,31), Time.new(2012,10,22).end_of_month
     
    assert_equal Time.new(2012,11,30), Time.new(2012,11,10).end_of_month

    assert_equal Time.new(2012,12,31), Time.new(2012,12,15).end_of_month   
  end
  
  def test_beginning_of_month
    assert_equal Time.new(2012,1,1), Time.new(2012,1,31).beginning_of_month
     
    assert_equal Time.new(2012,2,1), Time.new(2012,2,29).beginning_of_month
     
    assert_equal Time.new(2012,3,1), Time.new(2012,3,31).beginning_of_month
     
    assert_equal Time.new(2012,4,1), Time.new(2012,4,30).beginning_of_month
     
    assert_equal Time.new(2012,5,1), Time.new(2012,5,31).beginning_of_month
     
    assert_equal Time.new(2012,6,1), Time.new(2012,6,30).beginning_of_month
     
    assert_equal Time.new(2012,7,1), Time.new(2012,7,31).beginning_of_month
    
    assert_equal Time.new(2012,8,1), Time.new(2012,8,31).beginning_of_month
     
    assert_equal Time.new(2012,9,1), Time.new(2012,9,30).beginning_of_month
     
    assert_equal Time.new(2012,10,1), Time.new(2012,10,31).beginning_of_month
     
    assert_equal Time.new(2012,11,1), Time.new(2012,11,30).beginning_of_month

    assert_equal Time.new(2012,12,1), Time.new(2012,12,31).beginning_of_month
  end
  
  def test_days_array
    time = Time.new(2012,2,8)
    days_array_for_february =  [nil, nil, nil, 1, 2, 3, 4, 5,
                                6, 7, 8, 9, 10, 11, 12, 13, 14, 
                                15, 16, 17, 18, 19, 20, 21, 22, 
                                23, 24, 25, 26, 27, 28, 29]
    assert_kind_of Array,time.days_array
    assert_equal days_array_for_february, time.days_array
    
    time = Time.new(2012,7,1)
    days_array_for_july = [1, 2, 3, 4, 5, 6, 7,
                      8, 9, 10, 11, 12, 13, 
                      14, 15, 16, 17, 18, 19, 
                      20, 21, 22, 23, 24, 25, 
                      26, 27, 28, 29, 30, 31] 
    assert_kind_of Array,time.days_array
    assert_equal days_array_for_july, time.days_array
  end

  def test_week_split
    time = Time.new(2012,1,10)
    split_for_january = [[1, 2, 3, 4, 5, 6, 7],
                         [8, 9, 10, 11, 12, 13, 14], 
                         [15, 16, 17, 18, 19, 20, 21], 
                         [22, 23, 24, 25, 26, 27, 28], 
                         [29, 30, 31]]
    assert_kind_of Array, time.week_split
    assert_equal split_for_january, time.week_split
    
    time = Time.new(2012,10,15)
    split_for_october = [[nil, 1, 2, 3, 4, 5, 6], 
                         [7, 8, 9, 10, 11, 12, 13], 
                         [14, 15, 16, 17, 18, 19, 20], 
                         [21, 22, 23, 24, 25, 26, 27], 
                         [28, 29, 30, 31]]
    assert_kind_of Array, time.week_split
    assert_equal split_for_october, time.week_split 
  end
  
  def test_first_week?
    assert Time.new(2012,1,1).first_week?
    assert !Time.new(2012,1,31).first_week?
  end

  def test_second_week?
    assert Time.new(2012,10,9).second_week?
    assert !Time.new(2012,10,20).second_week?
  end

  def test_last_week?
    assert Time.new(2012,10,31).last_week?
    assert !Time.new(2012,10,20).last_week?  
  end

  def test_total_weeks
    assert_equal 5, Time.new(2012,10,31).total_weeks
    assert_equal 6, Time.new(2012,12,20).total_weeks  
  end

  def test_week_of_month_in_eng
    assert_equal 'First', Time.new(2012,12,1).week_of_month_in_eng
    assert_equal 'Second', Time.new(2012,12,4).week_of_month_in_eng
    assert_equal 'Third', Time.new(2012,12,9).week_of_month_in_eng
    assert_equal 'Fourth', Time.new(2012,12,16).week_of_month_in_eng
    assert_equal 'Fifth', Time.new(2012,12,24).week_of_month_in_eng
    assert_equal 'Sixth', Time.new(2012,12,31).week_of_month_in_eng
  end
  
  def test_week_of_month_in_fr
    assert_equal 'First', Time.new(2012,12,1).week_of_month_in_fr
    assert_equal 'Second', Time.new(2012,12,4).week_of_month_in_fr
    assert_equal 'Third', Time.new(2012,12,9).week_of_month_in_fr
    assert_equal 'Quatrième', Time.new(2012,12,16).week_of_month_in_fr
    assert_equal 'Cinquième', Time.new(2012,12,24).week_of_month_in_fr
    assert_equal 'sixième', Time.new(2012,12,31).week_of_month_in_fr    
  end
  
  def test_week_of_month_in_ger
    assert_equal 'First', Time.new(2012,12,1).week_of_month_in_ger
    assert_equal 'Second', Time.new(2012,12,4).week_of_month_in_ger
    assert_equal 'Dritten', Time.new(2012,12,9).week_of_month_in_ger
    assert_equal 'Vierte', Time.new(2012,12,16).week_of_month_in_ger
    assert_equal 'Fünfte', Time.new(2012,12,24).week_of_month_in_ger
    assert_equal 'Sechste', Time.new(2012,12,31).week_of_month_in_ger
  end
  
  def test_week_of_month_in_jap
    assert_equal '最初', Time.new(2012,12,1).week_of_month_in_jap
    assert_equal '秒', Time.new(2012,12,4).week_of_month_in_jap
    assert_equal 'サード', Time.new(2012,12,9).week_of_month_in_jap
    assert_equal '第4回', Time.new(2012,12,16).week_of_month_in_jap
    assert_equal '第五', Time.new(2012,12,24).week_of_month_in_jap
    assert_equal 'シックス',  Time.new(2012,12,31).week_of_month_in_jap    
  end
  
  def test_name_of_week_day
    assert_equal "Saturday",  Time.new(2012,12,1).name_of_week_day
    assert_equal "Sunday",  Time.new(2012,12,2).name_of_week_day
    assert_equal "Monday",  Time.new(2012,12,3).name_of_week_day
    assert_equal "Tuesday",  Time.new(2012,12,4).name_of_week_day
    assert_equal "Wednesday",  Time.new(2012,12,5).name_of_week_day
    assert_equal "Thursday",  Time.new(2012,12,6).name_of_week_day
    assert_equal "Friday",  Time.new(2012,12,7).name_of_week_day
  end
  
  def test_name_of_month
    assert_equal "January",  Time.new(2012,1,1).name_of_month
    assert_equal "February",  Time.new(2012,2,1).name_of_month
    assert_equal "March",  Time.new(2012,3,1).name_of_month
    assert_equal "April",  Time.new(2012,4,1).name_of_month
    assert_equal "May",  Time.new(2012,5,1).name_of_month
    assert_equal "June",  Time.new(2012,6,1).name_of_month
    assert_equal "July",  Time.new(2012,7,1).name_of_month
    assert_equal "August",  Time.new(2012,8,1).name_of_month
    assert_equal "September",  Time.new(2012,9,1).name_of_month
    assert_equal "October",  Time.new(2012,10,1).name_of_month
    assert_equal "November",  Time.new(2012,11,1).name_of_month
    assert_equal "December",  Time.new(2012,12,1).name_of_month
  end
  
  def test_week_end?
    assert !Time.new(2012,10,1).week_end?
    assert !Time.new(2012,10,31).week_end?
    assert Time.new(2012,10,6).week_end?
    assert Time.new(2012,10,7).week_end?
  end
  
  def test_working_day?
    assert Time.new(2012,10,1).working_day?
    assert Time.new(2012,10,31).working_day?
    assert !Time.new(2012,10,6).working_day?
    assert !Time.new(2012,10,7).working_day?
  end
  
  def test_all_sundays_in_month
    assert_equal [2, 9, 16, 23, 30], Time.new(2012,12,1).all_sundays_in_month
    assert_equal [7, 14, 21, 28], Time.new(2012,10,1).all_sundays_in_month
  end
  
  def test_all_mondays_in_month
    assert_equal [3, 10, 17, 24, 31], Time.new(2012,12,1).all_mondays_in_month
    assert_equal [1, 8, 15, 22, 29], Time.new(2012,10,1).all_mondays_in_month
  end
  
  def test_all_tuesdays_in_month
    assert_equal [4, 11, 18, 25], Time.new(2012,12,1).all_tuesdays_in_month
    assert_equal [2, 9, 16, 23, 30], Time.new(2012,10,1).all_tuesdays_in_month
  end

  def test_all_wednesdays_in_month
    assert_equal [5, 12, 19, 26], Time.new(2012,12,1).all_wednesdays_in_month
    assert_equal [3, 10, 17, 24, 31], Time.new(2012,10,1).all_wednesdays_in_month
  end

  def test_all_thursdays_in_month
    assert_equal [6, 13, 20, 27], Time.new(2012,12,1).all_thursdays_in_month
    assert_equal [4, 11, 18, 25], Time.new(2012,10,1).all_thursdays_in_month
  end
    
  def test_all_fridays_in_month
    assert_equal [7, 14, 21, 28], Time.new(2012,12,1).all_fridays_in_month
    assert_equal [5, 12, 19, 26], Time.new(2012,10,1).all_fridays_in_month
  end
  
  def test_all_saturdays_in_month
    assert_equal [1, 8, 15, 22, 29], Time.new(2012,12,1).all_saturdays_in_month
    assert_equal [6, 13, 20, 27], Time.new(2012,10,1).all_saturdays_in_month
  end
  
end
