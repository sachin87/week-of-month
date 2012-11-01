#!/bin/env ruby
# encoding: utf-8

require 'test/unit'
require_relative '../../week_of_month'

class TestWeek < Test::Unit::TestCase
  
   def test_week_of_month
    [Date,Time].each do |klass| 
      assert_equal 5, klass.new(2012,1,31).week_of_month
       
      assert_equal 5, klass.new(2012,2,29).week_of_month
       
      assert_equal 5, klass.new(2012,3,31).week_of_month
       
      assert_equal 5, klass.new(2012,4,30).week_of_month
       
      assert_equal 5, klass.new(2012,5,31).week_of_month
       
      assert_equal 5, klass.new(2012,6,30).week_of_month
       
      assert_equal 5, klass.new(2012,7,31).week_of_month
      
      assert_equal 5, klass.new(2012,8,31).week_of_month
       
      assert_equal 6, klass.new(2012,9,30).week_of_month 
       
      assert_equal 5, klass.new(2012,10,31).week_of_month
       
      assert_equal 5, klass.new(2012,11,30).week_of_month
  
      assert_equal 6, klass.new(2012,12,31).week_of_month
    end
  end
    
  def test_week_split
    [Date,Time].each do |klass|
      object = klass.new(2012,1,10)
      split_for_january = [[1, 2, 3, 4, 5, 6, 7],
                           [8, 9, 10, 11, 12, 13, 14],
                           [15, 16, 17, 18, 19, 20, 21],
                           [22, 23, 24, 25, 26, 27, 28],
                           [29, 30, 31]]
      assert_kind_of Array,object.week_split
      assert_equal split_for_january, object.week_split
    
      object = Date.new(2012,10,15)
      split_for_october = [[nil, 1, 2, 3, 4, 5, 6],
                           [7, 8, 9, 10, 11, 12, 13],
                           [14, 15, 16, 17, 18, 19, 20],
                           [21, 22, 23, 24, 25, 26, 27],
                           [28, 29, 30, 31]]
      assert_kind_of Array,object.week_split
      assert_equal split_for_october, object.week_split
    end
  end
  
  def test_first_week?
    [Date,Time].each do |klass|
      assert klass.new(2012,1,1).first_week?
      assert !klass.new(2012,1,31).first_week?
    end
  end

  def test_second_week?
    [Date,Time].each do |klass|
      assert klass.new(2012,10,9).second_week?
      assert !klass.new(2012,10,20).second_week?
    end
  end

  def test_last_week?
    [Date,Time].each do |klass|
      assert klass.new(2012,10,31).last_week?
      assert !klass.new(2012,10,20).last_week?
    end  
  end

  def test_total_weeks
    [Date,Time].each do |klass|
      assert_equal 5, klass.new(2012,10,31).total_weeks
      assert_equal 6, klass.new(2012,12,20).total_weeks
    end  
  end

  def test_week_of_month_in_eng
    [Date,Time].each do |klass|
      assert_equal 'First', klass.new(2012,12,1).week_of_month_in_eng
      assert_equal 'Second', klass.new(2012,12,4).week_of_month_in_eng
      assert_equal 'Third', klass.new(2012,12,9).week_of_month_in_eng
      assert_equal 'Fourth', klass.new(2012,12,16).week_of_month_in_eng
      assert_equal 'Fifth', klass.new(2012,12,24).week_of_month_in_eng
      assert_equal 'Sixth', klass.new(2012,12,31).week_of_month_in_eng
    end
  end
  
  def test_week_of_month_in_fr
    [Date,Time].each do |klass|
      assert_equal 'First', klass.new(2012,12,1).week_of_month_in_fr
      assert_equal 'Second', klass.new(2012,12,4).week_of_month_in_fr
      assert_equal 'Third', klass.new(2012,12,9).week_of_month_in_fr
      assert_equal 'Quatrième', klass.new(2012,12,16).week_of_month_in_fr
      assert_equal 'Cinquième', klass.new(2012,12,24).week_of_month_in_fr
      assert_equal 'sixième', klass.new(2012,12,31).week_of_month_in_fr
    end
  end
  
  def test_week_of_month_in_ger
    [Date,Time].each do |klass|
      assert_equal 'First', klass.new(2012,12,1).week_of_month_in_ger
      assert_equal 'Second', klass.new(2012,12,4).week_of_month_in_ger
      assert_equal 'Dritten', klass.new(2012,12,9).week_of_month_in_ger
      assert_equal 'Vierte', klass.new(2012,12,16).week_of_month_in_ger
      assert_equal 'Fünfte', klass.new(2012,12,24).week_of_month_in_ger
      assert_equal 'Sechste', klass.new(2012,12,31).week_of_month_in_ger
    end
  end
  
  def test_week_of_month_in_jap
    [Date,Time].each do |klass|
      assert_equal '最初', klass.new(2012,12,1).week_of_month_in_jap
      assert_equal '秒', klass.new(2012,12,4).week_of_month_in_jap
      assert_equal 'サード', klass.new(2012,12,9).week_of_month_in_jap
      assert_equal '第4回', klass.new(2012,12,16).week_of_month_in_jap
      assert_equal '第五', klass.new(2012,12,24).week_of_month_in_jap
      assert_equal 'シックス',  klass.new(2012,12,31).week_of_month_in_jap
    end
  end
  
  def test_week_end?
    [Date,Time].each do |klass|
      assert !klass.new(2012,10,1).week_end?
      assert !klass.new(2012,10,31).week_end?
      assert klass.new(2012,10,6).week_end?
      assert klass.new(2012,10,7).week_end?
    end
  end
  
  def test_working_day?
    [Date,Time].each do |klass|
      assert klass.new(2012,10,1).working_day?
      assert klass.new(2012,10,31).working_day?
      assert !klass.new(2012,10,6).working_day?
      assert !klass.new(2012,10,7).working_day?
    end
  end
  
end