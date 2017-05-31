#!/bin/env ruby
# encoding: utf-8

require 'test/unit'

RUBY_VERSION < '1.9' ? require('lib/week_of_month') : require_relative('../../../week_of_month')
class TestDayForDate < Test::Unit::TestCase
  def test_days_array
    object = Date.new(2012, 2, 8)

    days_array_for_february = [nil, nil, nil, 1, 2, 3, 4, 5,
                               6, 7, 8, 9, 10, 11, 12, 13, 14,
                               15, 16, 17, 18, 19, 20, 21, 22,
                               23, 24, 25, 26, 27, 28, 29]
    assert_kind_of Array, object.days_array
    assert_equal days_array_for_february, object.days_array

    object = Date.new(2012, 7, 1)
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
    object = Date.new(2014, 11, 3)

    days_array_for_november = [nil, nil, nil, nil, nil, 1, 2,
                               3, 4, 5, 6, 7, 8, 9, 10, 11,
                               12, 13, 14, 15, 16, 17, 18,
                               19, 20, 21, 22, 23, 24, 25, 26,
                               27, 28, 29, 30]
    assert_kind_of Array, object.days_array
    assert_equal days_array_for_november, object.days_array

    object = Date.new(2014, 12, 1)
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
    assert_equal 'Saturday', Date.new(2012, 12, 1).name_of_week_day
    assert_equal 'Sunday',  Date.new(2012, 12, 2).name_of_week_day
    assert_equal 'Monday',  Date.new(2012, 12, 3).name_of_week_day
    assert_equal 'Tuesday', Date.new(2012, 12, 4).name_of_week_day
    assert_equal 'Wednesday', Date.new(2012, 12, 5).name_of_week_day
    assert_equal 'Thursday', Date.new(2012, 12, 6).name_of_week_day
    assert_equal 'Friday', Date.new(2012, 12, 7).name_of_week_day
  end

  def test_upcoming_sunday
    assert_equal Date.new(2013, 1, 6), Date.new(2013, 1, 1).upcoming_sunday
    assert_equal Date.new(2013, 1, 6), Date.new(2013, 1, 5).upcoming_sunday
    assert_equal Date.new(2013, 1, 13), Date.new(2013, 1, 7).upcoming_sunday
    assert_equal Date.new(2013, 1, 6), Date.new(2012, 12, 30).upcoming_sunday
  end

  def test_upcoming_monday
    assert_equal Date.new(2013, 1, 7), Date.new(2013, 1, 1).upcoming_monday
  end

  def test_upcoming_tuesday
    assert_equal Date.new(2013, 1, 8), Date.new(2013, 1, 1).upcoming_tuesday
  end

  def test_upcoming_wednesday
    assert_equal Date.new(2013, 1, 2), Date.new(2013, 1, 1).upcoming_wednesday
  end

  def test_upcoming_thursday
    assert_equal Date.new(2013, 1, 3), Date.new(2013, 1, 1).upcoming_thursday
  end

  def test_upcoming_friday
    assert_equal Date.new(2013, 1, 4), Date.new(2013, 1, 1).upcoming_friday
  end

  def test_upcoming_saturday
    assert_equal Date.new(2013, 1, 5), Date.new(2013, 1, 1).upcoming_saturday
  end

  def test_previous_saturday
    assert_equal Date.new(2012, 12, 29), Date.new(2013, 1, 1).previous_saturday
  end

  def test_previous_friday
    assert_equal Date.new(2012, 12, 28), Date.new(2013, 1, 1).previous_friday
  end

  def test_previous_thursday
    assert_equal Date.new(2012, 12, 27), Date.new(2013, 1, 1).previous_thursday
  end

  def test_previous_wednesday
    assert_equal Date.new(2012, 12, 26), Date.new(2013, 1, 1).previous_wednesday
  end

  def test_previous_tuesday
    assert_equal Date.new(2012, 12, 25), Date.new(2013, 1, 1).previous_tuesday
  end

  def test_previous_monday
    assert_equal Date.new(2012, 12, 31), Date.new(2013, 1, 1).previous_monday
  end

  def test_previous_sunday
    assert_equal Date.new(2012, 12, 30), Date.new(2013, 1, 1).previous_sunday
    assert_equal Date.new(2012, 12, 30), Date.new(2013, 1, 1).previous_sunday
  end

  def test_all_working_days_of_month
    assert_equal [
      Date.new(2013, 4, 30), Date.new(2013, 4, 29),
      Date.new(2013, 4, 26), Date.new(2013, 4, 25), Date.new(2013, 4, 24), Date.new(2013, 4, 23), Date.new(2013, 4, 22),
      Date.new(2013, 4, 19), Date.new(2013, 4, 18), Date.new(2013, 4, 17), Date.new(2013, 4, 16), Date.new(2013, 4, 15),
      Date.new(2013, 4, 12), Date.new(2013, 4, 11), Date.new(2013, 4, 10), Date.new(2013, 4, 9), Date.new(2013, 4, 8),
      Date.new(2013, 4, 5), Date.new(2013, 4, 4), Date.new(2013, 4, 3), Date.new(2013, 4, 2), Date.new(2013, 4, 1)
    ], Date.new(2013, 4, 1).all_working_days_of_month
  end

  def test_all_non_week_days_of_month
    assert_equal [
      Date.new(2013, 4, 28), Date.new(2013, 4, 27),
      Date.new(2013, 4, 21), Date.new(2013, 4, 20),
      Date.new(2013, 4, 14), Date.new(2013, 4, 13),
      Date.new(2013, 4, 7), Date.new(2013, 4, 6)
    ], Date.new(2013, 4, 1).all_non_week_days_of_month
  end

  def test_first_working_day_of_the_month
    assert_equal Date.new(2013, 1, 1), Date.new(2013, 1, 1).first_working_day_of_the_month
  end
end
