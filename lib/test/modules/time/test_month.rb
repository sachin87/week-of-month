#!/bin/env ruby
# encoding: utf-8

require 'test/unit'

if RUBY_VERSION < '1.9'
  require('lib/week_of_month')
else
  require_relative('../../../week_of_month')
end

class TestMonthForTime < Test::Unit::TestCase
  def test_month?
    assert Time.new(2012, 1, 1).january?

    assert Time.new(2012, 2, 1).february?

    assert Time.new(2012, 3, 1).march?

    assert Time.new(2012, 4, 1).april?

    assert Time.new(2012, 5, 1).may?

    assert Time.new(2012, 6, 1).june?

    assert Time.new(2012, 7, 1).july?

    assert Time.new(2012, 8, 1).august?

    assert Time.new(2012, 9, 1).september?

    assert Time.new(2012, 10, 1).october?

    assert Time.new(2012, 11, 1).november?

    assert Time.new(2012, 12, 1).december?
  end

  def test_last_day_of_month
    assert_equal 31, Time.new(2012, 1, 31).last_day_of_month

    assert_equal 29, Time.new(2012, 2, 29).last_day_of_month

    assert_equal 31, Time.new(2012, 3, 31).last_day_of_month

    assert_equal 30, Time.new(2012, 4, 30).last_day_of_month

    assert_equal 31, Time.new(2012, 5, 31).last_day_of_month

    assert_equal 30, Time.new(2012, 6, 30).last_day_of_month

    assert_equal 31, Time.new(2012, 7, 31).last_day_of_month

    assert_equal 31, Time.new(2012, 8, 31).last_day_of_month

    assert_equal 30, Time.new(2012, 9, 30).last_day_of_month

    assert_equal 31, Time.new(2012, 10, 31).last_day_of_month

    assert_equal 30, Time.new(2012, 11, 30).last_day_of_month

    assert_equal 31, Time.new(2012, 12, 31).last_day_of_month
  end

  def test_ending_of_month
    assert_equal Time.new(2012, 1, 31), Time.new(2012, 1, 1).ending_of_month

    assert_equal Time.new(2012, 2, 29), Time.new(2012, 2, 2).ending_of_month

    assert_equal Time.new(2012, 3, 31), Time.new(2012, 3, 1).ending_of_month

    assert_equal Time.new(2012, 4, 30), Time.new(2012, 4, 3).ending_of_month

    assert_equal Time.new(2012, 5, 31), Time.new(2012, 5, 1).ending_of_month

    assert_equal Time.new(2012, 6, 30), Time.new(2012, 6, 30).ending_of_month

    assert_equal Time.new(2012, 7, 31), Time.new(2012, 7, 1).ending_of_month

    assert_equal Time.new(2012, 8, 31), Time.new(2012, 8, 5).ending_of_month

    assert_equal Time.new(2012, 9, 30), Time.new(2012, 9, 2).ending_of_month

    assert_equal Time.new(2012, 10, 31), Time.new(2012, 10, 22).ending_of_month

    assert_equal Time.new(2012, 11, 30), Time.new(2012, 11, 10).ending_of_month

    assert_equal Time.new(2012, 12, 31), Time.new(2012, 12, 15).ending_of_month
  end

  def test_beginning_of_month
    assert_equal Time.new(2012, 1, 1), Time.new(2012, 1, 31).beginning_of_month

    assert_equal Time.new(2012, 2, 1), Time.new(2012, 2, 29).beginning_of_month

    assert_equal Time.new(2012, 3, 1), Time.new(2012, 3, 31).beginning_of_month

    assert_equal Time.new(2012, 4, 1), Time.new(2012, 4, 30).beginning_of_month

    assert_equal Time.new(2012, 5, 1), Time.new(2012, 5, 31).beginning_of_month

    assert_equal Time.new(2012, 6, 1), Time.new(2012, 6, 30).beginning_of_month

    assert_equal Time.new(2012, 7, 1), Time.new(2012, 7, 31).beginning_of_month

    assert_equal Time.new(2012, 8, 1), Time.new(2012, 8, 31).beginning_of_month

    assert_equal Time.new(2012, 9, 1), Time.new(2012, 9, 30).beginning_of_month

    assert_equal Time.new(2012, 10, 1), Time.new(2012, 10, 31).beginning_of_month

    assert_equal Time.new(2012, 11, 1), Time.new(2012, 11, 30).beginning_of_month

    assert_equal Time.new(2012, 12, 1), Time.new(2012, 12, 31).beginning_of_month
  end

  def test_all_sundays_in_month
    assert_equal [6, 13, 20, 27], Time.new(2013, 1, 1).all_sundays_in_month
    assert_equal [3, 10, 17, 24], Time.new(2013, 2, 1).all_sundays_in_month
  end

  def test_all_mondays_in_month
    assert_equal [7, 14, 21, 28], Time.new(2013, 1, 1).all_mondays_in_month
    assert_equal [4, 11, 18, 25], Time.new(2013, 2, 1).all_mondays_in_month
  end

  def test_all_tuesdays_in_month
    assert_equal [1, 8, 15, 22, 29], Time.new(2013, 1, 1).all_tuesdays_in_month
    assert_equal [5, 12, 19, 26], Time.new(2013, 2, 1).all_tuesdays_in_month
  end

  def test_all_wednesdays_in_month
    assert_equal [2, 9, 16, 23, 30], Time.new(2013, 1, 1).all_wednesdays_in_month
    assert_equal [6, 13, 20, 27], Time.new(2013, 2, 1).all_wednesdays_in_month
  end

  def test_all_thursdays_in_month
    assert_equal [3, 10, 17, 24, 31], Time.new(2013, 1, 1).all_thursdays_in_month
    assert_equal [7, 14, 21, 28], Time.new(2013, 2, 1).all_thursdays_in_month
  end

  def test_all_fridays_in_month
    assert_equal [4, 11, 18, 25], Time.new(2013, 1, 1).all_fridays_in_month
    assert_equal [1, 8, 15, 22], Time.new(2013, 2, 1).all_fridays_in_month
  end

  def test_all_saturdays_in_month
    assert_equal [5, 12, 19, 26], Time.new(2013, 1, 1).all_saturdays_in_month
    assert_equal [2, 9, 16, 23], Time.new(2013, 2, 1).all_saturdays_in_month
  end

  def test_name_of_month
    assert_equal 'January', Time.new(2012, 1, 1).name_of_month
    assert_equal 'February', Time.new(2012, 2, 1).name_of_month
    assert_equal 'March', Time.new(2012, 3, 1).name_of_month
    assert_equal 'April', Time.new(2012, 4, 1).name_of_month
    assert_equal 'May', Time.new(2012, 5, 1).name_of_month
    assert_equal 'June', Time.new(2012, 6, 1).name_of_month
    assert_equal 'July', Time.new(2012, 7, 1).name_of_month
    assert_equal 'August', Time.new(2012, 8, 1).name_of_month
    assert_equal 'September', Time.new(2012, 9, 1).name_of_month
    assert_equal 'October', Time.new(2012, 10, 1).name_of_month
    assert_equal 'November', Time.new(2012, 11, 1).name_of_month
    assert_equal 'December', Time.new(2012, 12, 1).name_of_month
  end

  def test_each_sunday_in_month
    assert_equal Time.new(2013, 1, 6), Time.new(2013, 1, 1).first_sunday_in_month
    assert_equal Time.new(2013, 1, 13), Time.new(2013, 1, 1).second_sunday_in_month
    assert_equal Time.new(2013, 1, 20), Time.new(2013, 1, 1).third_sunday_in_month
    assert_equal Time.new(2013, 1, 27), Time.new(2013, 1, 1).fourth_sunday_in_month
    assert_nil Time.new(2013, 1, 1).fifth_sunday_in_month

    assert_equal Time.new(2013, 2, 3), Time.new(2013, 2, 1).first_sunday_in_month
    assert_equal Time.new(2013, 2, 10), Time.new(2013, 2, 1).second_sunday_in_month
    assert_equal Time.new(2013, 2, 17), Time.new(2013, 2, 1).third_sunday_in_month
    assert_equal Time.new(2013, 2, 24), Time.new(2013, 2, 1).fourth_sunday_in_month
    assert_nil Time.new(2013, 2, 1).fifth_sunday_in_month
  end

  def test_each_monday_in_month
    assert_equal Time.new(2013, 1, 7), Time.new(2013, 1, 1).first_monday_in_month
    assert_equal Time.new(2013, 1, 14), Time.new(2013, 1, 1).second_monday_in_month
    assert_equal Time.new(2013, 1, 21), Time.new(2013, 1, 1).third_monday_in_month
    assert_equal Time.new(2013, 1, 28), Time.new(2013, 1, 1).fourth_monday_in_month
    assert_nil Time.new(2013, 1, 1).fifth_monday_in_month

    assert_equal Time.new(2013, 2, 4), Time.new(2013, 2, 1).first_monday_in_month
    assert_equal Time.new(2013, 2, 11), Time.new(2013, 2, 1).second_monday_in_month
    assert_equal Time.new(2013, 2, 18), Time.new(2013, 2, 1).third_monday_in_month
    assert_equal Time.new(2013, 2, 25), Time.new(2013, 2, 1).fourth_monday_in_month
    assert_nil Time.new(2013, 2, 1).fifth_monday_in_month
  end

  def test_each_tuesday_in_month
    assert_equal Time.new(2013, 1, 1), Time.new(2013, 1, 1).first_tuesday_in_month
    assert_equal Time.new(2013, 1, 8), Time.new(2013, 1, 1).second_tuesday_in_month
    assert_equal Time.new(2013, 1, 15), Time.new(2013, 1, 1).third_tuesday_in_month
    assert_equal Time.new(2013, 1, 22), Time.new(2013, 1, 1).fourth_tuesday_in_month
    assert_equal Time.new(2013, 1, 29), Time.new(2013, 1, 1).fifth_tuesday_in_month

    assert_equal Time.new(2013, 2, 5), Time.new(2013, 2, 1).first_tuesday_in_month
    assert_equal Time.new(2013, 2, 12), Time.new(2013, 2, 1).second_tuesday_in_month
    assert_equal Time.new(2013, 2, 19), Time.new(2013, 2, 1).third_tuesday_in_month
    assert_equal Time.new(2013, 2, 26), Time.new(2013, 2, 1).fourth_tuesday_in_month
    assert_nil Time.new(2013, 2, 1).fifth_tuesday_in_month
  end

  def test_each_wednesday_in_month
    assert_equal Time.new(2013, 1, 2), Time.new(2013, 1, 1).first_wednesday_in_month
    assert_equal Time.new(2013, 1, 9), Time.new(2013, 1, 1).second_wednesday_in_month
    assert_equal Time.new(2013, 1, 16), Time.new(2013, 1, 1).third_wednesday_in_month
    assert_equal Time.new(2013, 1, 23), Time.new(2013, 1, 1).fourth_wednesday_in_month
    assert_equal Time.new(2013, 1, 30), Time.new(2013, 1, 1).fifth_wednesday_in_month

    assert_equal Time.new(2013, 2, 6), Time.new(2013, 2, 1).first_wednesday_in_month
    assert_equal Time.new(2013, 2, 13), Time.new(2013, 2, 1).second_wednesday_in_month
    assert_equal Time.new(2013, 2, 20), Time.new(2013, 2, 1).third_wednesday_in_month
    assert_equal Time.new(2013, 2, 27), Time.new(2013, 2, 1).fourth_wednesday_in_month
    assert_nil Time.new(2013, 2, 1).fifth_wednesday_in_month
  end

  def test_each_thursday_in_month
    assert_equal Time.new(2013, 1, 3), Time.new(2013, 1, 1).first_thursday_in_month
    assert_equal Time.new(2013, 1, 10), Time.new(2013, 1, 1).second_thursday_in_month
    assert_equal Time.new(2013, 1, 17), Time.new(2013, 1, 1).third_thursday_in_month
    assert_equal Time.new(2013, 1, 24), Time.new(2013, 1, 1).fourth_thursday_in_month
    assert_equal Time.new(2013, 1, 31), Time.new(2013, 1, 1).fifth_thursday_in_month

    assert_equal Time.new(2013, 2, 7), Time.new(2013, 2, 1).first_thursday_in_month
    assert_equal Time.new(2013, 2, 14), Time.new(2013, 2, 1).second_thursday_in_month
    assert_equal Time.new(2013, 2, 21), Time.new(2013, 2, 1).third_thursday_in_month
    assert_equal Time.new(2013, 2, 28), Time.new(2013, 2, 1).fourth_thursday_in_month
    assert_nil Time.new(2013, 2, 1).fifth_thursday_in_month
  end

  def test_each_friday_in_month
    assert_equal Time.new(2013, 1, 4), Time.new(2013, 1, 1).first_friday_in_month
    assert_equal Time.new(2013, 1, 11), Time.new(2013, 1, 1).second_friday_in_month
    assert_equal Time.new(2013, 1, 18), Time.new(2013, 1, 1).third_friday_in_month
    assert_equal Time.new(2013, 1, 25), Time.new(2013, 1, 1).fourth_friday_in_month
    assert_nil Time.new(2013, 1, 1).fifth_friday_in_month

    assert_equal Time.new(2013, 2, 1), Time.new(2013, 2, 1).first_friday_in_month
    assert_equal Time.new(2013, 2, 8), Time.new(2013, 2, 1).second_friday_in_month
    assert_equal Time.new(2013, 2, 15), Time.new(2013, 2, 1).third_friday_in_month
    assert_equal Time.new(2013, 2, 22), Time.new(2013, 2, 1).fourth_friday_in_month
    assert_nil Time.new(2013, 2, 1).fifth_friday_in_month
  end

  def test_each_saturday_in_month
    assert_equal Time.new(2013, 1, 5), Time.new(2013, 1, 1).first_saturday_in_month
    assert_equal Time.new(2013, 1, 12), Time.new(2013, 1, 1).second_saturday_in_month
    assert_equal Time.new(2013, 1, 19), Time.new(2013, 1, 1).third_saturday_in_month
    assert_equal Time.new(2013, 1, 26), Time.new(2013, 1, 1).fourth_saturday_in_month
    assert_nil Time.new(2013, 1, 1).fifth_saturday_in_month

    assert_equal Time.new(2013, 2, 2), Time.new(2013, 2, 1).first_saturday_in_month
    assert_equal Time.new(2013, 2, 9), Time.new(2013, 2, 1).second_saturday_in_month
    assert_equal Time.new(2013, 2, 16), Time.new(2013, 2, 1).third_saturday_in_month
    assert_equal Time.new(2013, 2, 23), Time.new(2013, 2, 1).fourth_saturday_in_month
    assert_nil Time.new(2013, 2, 1).fifth_saturday_in_month
  end
end
