#!/bin/env ruby
# encoding: utf-8

require 'test/unit'
require_relative '../../week_of_month'

class TestDay < Test::Unit::TestCase
  
  def test_days_array
    [Date,Time].each do |klass|
      object = klass.new(2012,2,8)
      days_array_for_february =  [nil, nil, nil, 1, 2, 3, 4, 5,
                                   6, 7, 8, 9, 10, 11, 12, 13, 14, 
                                   15, 16, 17, 18, 19, 20, 21, 22, 
                                   23, 24, 25, 26, 27, 28, 29]
      assert_kind_of Array,object.days_array
      assert_equal days_array_for_february, object.days_array
    
      date = klass.new(2012,7,1)
      days_array_for_july = [1, 2, 3, 4, 5, 6, 7,
                             8, 9, 10, 11, 12, 13, 
                             14, 15, 16, 17, 18, 19, 
                             20, 21, 22, 23, 24, 25, 
                             26, 27, 28, 29, 30, 31] 
      assert_kind_of Array,object.days_array
      assert_equal days_array_for_july, object.days_array
    end
  end
  
  def test_name_of_week_day
    [Date,Time].each do |klass|
      assert_equal "Saturday",  klass.new(2012,12,1).name_of_week_day
      assert_equal "Sunday",  klass.new(2012,12,2).name_of_week_day
      assert_equal "Monday",  klass.new(2012,12,3).name_of_week_day
      assert_equal "Tuesday",  klass.new(2012,12,4).name_of_week_day
      assert_equal "Wednesday",  klass.new(2012,12,5).name_of_week_day
      assert_equal "Thursday",  klass.new(2012,12,6).name_of_week_day
      assert_equal "Friday",  klass.new(2012,12,7).name_of_week_day
    end
  end
  
  

end