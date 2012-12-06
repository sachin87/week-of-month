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

      object = klass.new(2012,7,1)
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

  def test_days_between_dates
    [Date,Time].each do |klass|
      assert_equal -16, klass.days_between_dates(klass.new(2012,12,1),klass.new(2012,12,17))
    end
  end

  def test_upcoming_sunday
    [Date,Time].each do |klass|
      date = klass.new(2012,12,1)
      assert_equal klass.new(2012,12,2), date.upcoming_sunday
    end
  end

  def test_upcoming_monday
    [Date,Time].each do |klass|
      date = klass.new(2012,12,1)
      assert_equal klass.new(2012,12,3), date.upcoming_monday
    end
  end

  def test_upcoming_tuesday
    [Date,Time].each do |klass|
      date = klass.new(2012,12,1)
      assert_equal klass.new(2012,12,4), date.upcoming_tuesday
    end
  end

  def test_upcoming_wednesday
    [Date,Time].each do |klass|
      date = klass.new(2012,12,1)
      assert_equal klass.new(2012,12,5), date.upcoming_wednesday
    end
  end

  def test_upcoming_thursday
    [Date,Time].each do |klass|
      date = klass.new(2012,12,1)
      assert_equal klass.new(2012,12,6), date.upcoming_thursday
    end
  end

  def test_upcoming_friday
    [Date,Time].each do |klass|
      date = klass.new(2012,12,1)
      assert_equal klass.new(2012,12,7), date.upcoming_friday
    end
  end

  def test_upcoming_saturday
    [Date,Time].each do |klass|
      date = klass.new(2012,12,1)
      assert_equal klass.new(2012,12,1), date.upcoming_saturday
    end
  end

  def test_previous_saturday
    [Date,Time].each do |klass|
      date = klass.new(2012,12,1)
      assert_equal klass.new(2012,12,1), date.previous_saturday
    end
  end

  def test_previous_friday
    [Date,Time].each do |klass|
      date = klass.new(2012,12,1)
      assert_equal klass.new(2012,12,7), date.upcoming_friday
    end
  end

  def test_previous_thursday
    [Date,Time].each do |klass|
      date = klass.new(2012,12,1)
      assert_equal klass.new(2012,12,6), date.upcoming_thursday
    end
  end

  def test_previous_wednesday
    [Date,Time].each do |klass|
      date = klass.new(2012,12,1)
      assert_equal klass.new(2012,12,5), date.upcoming_wednesday
    end
  end

  def test_previous_tuesday
    [Date,Time].each do |klass|
      date = klass.new(2012,12,1)
      assert_equal klass.new(2012,12,4), date.upcoming_tuesday
    end
  end

  def test_previous_monday
    [Date,Time].each do |klass|
      date = klass.new(2012,12,1)
      assert_equal klass.new(2012,12,3), date.upcoming_monday
    end
  end

  def test_previous_sunday
    [Date,Time].each do |klass|
      date = klass.new(2012,12,1)
      assert_equal klass.new(2012,12,2), date.upcoming_sunday
    end
  end

end