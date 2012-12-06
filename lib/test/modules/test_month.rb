#!/bin/env ruby
# encoding: utf-8

require 'test/unit'
require_relative '../../week_of_month'

class TestMonth < Test::Unit::TestCase
  
  def test_month?
    [Date,Time].each do |klass|
      assert klass.new(2012,1,1).january?
     
      assert klass.new(2012,2,1).february?
     
      assert klass.new(2012,3,1).march?
     
      assert klass.new(2012,4,1).april?
     
      assert klass.new(2012,5,1).may?
     
      assert klass.new(2012,6,1).june?
     
      assert klass.new(2012,7,1).july?
    
      assert klass.new(2012,8,1).august?
     
      assert klass.new(2012,9,1).september? 
     
      assert klass.new(2012,10,1).october?
     
      assert klass.new(2012,11,1).november?

      assert klass.new(2012,12,1).december?
    end   
  end
    
   def test_last_day_of_month
    [Date,Time].each do |klass|
      assert_equal 31, klass.new(2012,1,31).last_day_of_month
     
      assert_equal 29, klass.new(2012,2,29).last_day_of_month
     
      assert_equal 31, klass.new(2012,3,31).last_day_of_month
     
      assert_equal 30, klass.new(2012,4,30).last_day_of_month
     
      assert_equal 31, klass.new(2012,5,31).last_day_of_month
     
      assert_equal 30, klass.new(2012,6,30).last_day_of_month
     
      assert_equal 31, klass.new(2012,7,31).last_day_of_month
    
      assert_equal 31, klass.new(2012,8,31).last_day_of_month
     
      assert_equal 30, klass.new(2012,9,30).last_day_of_month
     
      assert_equal 31, klass.new(2012,10,31).last_day_of_month
     
      assert_equal 30, klass.new(2012,11,30).last_day_of_month

      assert_equal 31, klass.new(2012,12,31).last_day_of_month
    end
  end
  
  def test_end_of_month
    [Date,Time].each do |klass|
      assert_equal klass.new(2012,1,31), klass.new(2012,1,1).end_of_month
     
      assert_equal klass.new(2012,2,29), klass.new(2012,2,2).end_of_month
     
      assert_equal klass.new(2012,3,31), klass.new(2012,3,1).end_of_month
     
      assert_equal klass.new(2012,4,30), klass.new(2012,4,3).end_of_month
     
      assert_equal klass.new(2012,5,31), klass.new(2012,5,1).end_of_month
     
      assert_equal klass.new(2012,6,30), klass.new(2012,6,30).end_of_month
     
      assert_equal klass.new(2012,7,31), klass.new(2012,7,1).end_of_month
    
      assert_equal klass.new(2012,8,31), klass.new(2012,8,5).end_of_month
     
      assert_equal klass.new(2012,9,30), klass.new(2012,9,2).end_of_month
     
      assert_equal klass.new(2012,10,31), klass.new(2012,10,22).end_of_month
     
      assert_equal klass.new(2012,11,30), klass.new(2012,11,10).end_of_month

      assert_equal klass.new(2012,12,31), klass.new(2012,12,15).end_of_month
    end   
  end
  
  def test_beginning_of_month
    [Date,Time].each do |klass|
      assert_equal klass.new(2012,1,1), klass.new(2012,1,31).beginning_of_month
     
      assert_equal klass.new(2012,2,1), klass.new(2012,2,29).beginning_of_month
     
      assert_equal klass.new(2012,3,1), klass.new(2012,3,31).beginning_of_month
     
      assert_equal klass.new(2012,4,1), klass.new(2012,4,30).beginning_of_month
     
      assert_equal klass.new(2012,5,1), klass.new(2012,5,31).beginning_of_month
     
      assert_equal klass.new(2012,6,1), klass.new(2012,6,30).beginning_of_month
     
      assert_equal klass.new(2012,7,1), klass.new(2012,7,31).beginning_of_month
    
      assert_equal klass.new(2012,8,1), klass.new(2012,8,31).beginning_of_month
     
      assert_equal klass.new(2012,9,1), klass.new(2012,9,30).beginning_of_month
     
      assert_equal klass.new(2012,10,1), klass.new(2012,10,31).beginning_of_month
     
      assert_equal klass.new(2012,11,1), klass.new(2012,11,30).beginning_of_month

      assert_equal klass.new(2012,12,1), klass.new(2012,12,31).beginning_of_month
    end
  end
    
  def test_all_sundays_in_month
    [Date,Time].each do |klass|
      assert_equal [2, 9, 16, 23, 30], klass.new(2012,12,1).all_sundays_in_month
      assert_equal [7, 14, 21, 28], klass.new(2012,10,1).all_sundays_in_month
    end
  end
  
  def test_all_mondays_in_month
    [Date,Time].each do |klass|
      assert_equal [3, 10, 17, 24, 31], klass.new(2012,12,1).all_mondays_in_month
      assert_equal [1, 8, 15, 22, 29], klass.new(2012,10,1).all_mondays_in_month
    end
  end
  
  def test_all_tuesdays_in_month
    [Date,Time].each do |klass|
      assert_equal [4, 11, 18, 25], klass.new(2012,12,1).all_tuesdays_in_month
      assert_equal [2, 9, 16, 23, 30], klass.new(2012,10,1).all_tuesdays_in_month
    end
  end

  def test_all_wednesdays_in_month
    [Date,Time].each do |klass|
      assert_equal [5, 12, 19, 26], klass.new(2012,12,1).all_wednesdays_in_month
      assert_equal [3, 10, 17, 24, 31], klass.new(2012,10,1).all_wednesdays_in_month
    end
  end

  def test_all_thursdays_in_month
    [Date,Time].each do |klass|
      assert_equal [6, 13, 20, 27], klass.new(2012,12,1).all_thursdays_in_month
      assert_equal [4, 11, 18, 25], klass.new(2012,10,1).all_thursdays_in_month
    end
  end
    
  def test_all_fridays_in_month
    [Date,Time].each do |klass|
      assert_equal [7, 14, 21, 28], klass.new(2012,12,1).all_fridays_in_month
      assert_equal [5, 12, 19, 26], klass.new(2012,10,1).all_fridays_in_month
    end
  end
  
  def test_all_saturdays_in_month
    [Date,Time].each do |klass|
      assert_equal [1, 8, 15, 22, 29], klass.new(2012,12,1).all_saturdays_in_month
      assert_equal [6, 13, 20, 27], klass.new(2012,10,1).all_saturdays_in_month
    end
  end
  
  def test_name_of_month
    [Date,Time].each do |klass|
      assert_equal "January", klass.new(2012,1,1).name_of_month
      assert_equal "February", klass.new(2012,2,1).name_of_month
      assert_equal "March", klass.new(2012,3,1).name_of_month
      assert_equal "April", klass.new(2012,4,1).name_of_month
      assert_equal "May", klass.new(2012,5,1).name_of_month
      assert_equal "June", klass.new(2012,6,1).name_of_month
      assert_equal "July", klass.new(2012,7,1).name_of_month
      assert_equal "August", klass.new(2012,8,1).name_of_month
      assert_equal "September", klass.new(2012,9,1).name_of_month
      assert_equal "October", klass.new(2012,10,1).name_of_month
      assert_equal "November", klass.new(2012,11,1).name_of_month
      assert_equal "December", klass.new(2012,12,1).name_of_month
    end
  end
  
  def test_month_between_dates
    [Date,Time].each do |klass|
      assert_equal 9, klass.months_between_dates(klass.new(2012,10,1),klass.new(2012,1,1))
    end
  end
  
end