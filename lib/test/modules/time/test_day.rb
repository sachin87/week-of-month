#!/bin/env ruby
# encoding: utf-8

require 'test/unit'

RUBY_VERSION < '1.9' ? require('lib/week_of_month') : require_relative('../../../week_of_month')
class TestDayForTime < Test::Unit::TestCase
  def test_days_array
    object = Time.new(2012, 2, 8)

    days_array_for_february = [nil, nil, nil, 1, 2, 3, 4, 5,
                               6, 7, 8, 9, 10, 11, 12, 13, 14,
                               15, 16, 17, 18, 19, 20, 21, 22,
                               23, 24, 25, 26, 27, 28, 29]
    assert_kind_of Array, object.days_array
    assert_equal days_array_for_february, object.days_array

    object = Time.new(2012, 7, 1)
    days_array_for_july = [1, 2, 3, 4, 5, 6, 7,
                           8, 9, 10, 11, 12, 13,
                           14, 15, 16, 17, 18, 19,
                           20, 21, 22, 23, 24, 25,
                           26, 27, 28, 29, 30, 31]
    assert_kind_of Array, object.days_array
    assert_equal days_array_for_july, object.days_array
  end

  def test_days_array_monday
    WeekOfMonth.configuration.monday_active = true
    object = Time.new(2014, 11, 3)

    days_array_for_november = [nil, nil, nil, nil, nil, 1, 2,
                               3, 4, 5, 6, 7, 8, 9, 10, 11,
                               12, 13, 14, 15, 16, 17, 18,
                               19, 20, 21, 22, 23, 24, 25, 26,
                               27, 28, 29, 30]
    assert_kind_of Array, object.days_array
    assert_equal days_array_for_november, object.days_array

    object = Time.new(2014, 12, 1)
    days_array_for_december = [1, 2, 3, 4, 5, 6, 7,
                               8, 9, 10, 11, 12, 13,
                               14, 15, 16, 17, 18, 19,
                               20, 21, 22, 23, 24, 25,
                               26, 27, 28, 29, 30, 31]
    assert_kind_of Array, object.days_array
    assert_equal days_array_for_december, object.days_array
  end

  def test_name_of_week_day
    WeekOfMonth.configuration.monday_active = false
    assert_equal 'Saturday', Time.new(2012, 12, 1).name_of_week_day
    assert_equal 'Sunday',  Time.new(2012, 12, 2).name_of_week_day
    assert_equal 'Monday',  Time.new(2012, 12, 3).name_of_week_day
    assert_equal 'Tuesday', Time.new(2012, 12, 4).name_of_week_day
    assert_equal 'Wednesday', Time.new(2012, 12, 5).name_of_week_day
    assert_equal 'Thursday', Time.new(2012, 12, 6).name_of_week_day
    assert_equal 'Friday', Time.new(2012, 12, 7).name_of_week_day
  end

  def test_upcoming_sunday
    assert_equal Time.new(2013, 1, 6), Time.new(2013, 1, 1).upcoming_sunday
    assert_equal Time.new(2013, 1, 6), Time.new(2013, 1, 5).upcoming_sunday
    assert_equal Time.new(2013, 1, 13), Time.new(2013, 1, 7).upcoming_sunday
    assert_equal Time.new(2013, 1, 6), Time.new(2012, 12, 30).upcoming_sunday
  end

  def test_upcoming_monday
    assert_equal Time.new(2013, 1, 7), Time.new(2013, 1, 1).upcoming_monday
  end

  def test_upcoming_tuesday
    assert_equal Time.new(2013, 1, 8), Time.new(2013, 1, 1).upcoming_tuesday
  end

  def test_upcoming_wednesday
    assert_equal Time.new(2013, 1, 2), Time.new(2013, 1, 1).upcoming_wednesday
  end

  def test_upcoming_thursday
    assert_equal Time.new(2013, 1, 3), Time.new(2013, 1, 1).upcoming_thursday
  end

  def test_upcoming_friday
    assert_equal Time.new(2013, 1, 4), Time.new(2013, 1, 1).upcoming_friday
  end

  def test_upcoming_saturday
    assert_equal Time.new(2013, 1, 5), Time.new(2013, 1, 1).upcoming_saturday
  end

  def test_previous_saturday
    assert_equal Time.new(2012, 12, 29), Time.new(2013, 1, 1).previous_saturday
  end

  def test_previous_friday
    assert_equal Time.new(2012, 12, 28), Time.new(2013, 1, 1).previous_friday
  end

  def test_previous_thursday
    assert_equal Time.new(2012, 12, 27), Time.new(2013, 1, 1).previous_thursday
  end

  def test_previous_wednesday
    assert_equal Time.new(2012, 12, 26), Time.new(2013, 1, 1).previous_wednesday
  end

  def test_previous_tuesday
    assert_equal Time.new(2012, 12, 25), Time.new(2013, 1, 1).previous_tuesday
  end

  def test_previous_monday
    assert_equal Time.new(2012, 12, 31), Time.new(2013, 1, 1).previous_monday
  end

  def test_previous_sunday
    assert_equal Time.new(2012, 12, 30), Time.new(2013, 1, 1).previous_sunday
    assert_equal Time.new(2012, 12, 30), Time.new(2013, 1, 1).previous_sunday
  end

end
