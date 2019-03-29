#!/bin/env ruby
# encoding: utf-8

require 'test/unit'

if RUBY_VERSION < '1.9'
  require('lib/week_of_month')
else
  require_relative('../../../week_of_month')
end

class TestMonthForDate < Test::Unit::TestCase
  def test_month?
    assert Date.new(2012, 1, 1).january?

    assert Date.new(2012, 2, 1).february?

    assert Date.new(2012, 3, 1).march?

    assert Date.new(2012, 4, 1).april?

    assert Date.new(2012, 5, 1).may?

    assert Date.new(2012, 6, 1).june?

    assert Date.new(2012, 7, 1).july?

    assert Date.new(2012, 8, 1).august?

    assert Date.new(2012, 9, 1).september?

    assert Date.new(2012, 10, 1).october?

    assert Date.new(2012, 11, 1).november?

    assert Date.new(2012, 12, 1).december?
  end

  def test_last_day_of_month
    assert_equal 31, Date.new(2012, 1, 31).last_day_of_month

    assert_equal 29, Date.new(2012, 2, 29).last_day_of_month

    assert_equal 31, Date.new(2012, 3, 31).last_day_of_month

    assert_equal 30, Date.new(2012, 4, 30).last_day_of_month

    assert_equal 31, Date.new(2012, 5, 31).last_day_of_month

    assert_equal 30, Date.new(2012, 6, 30).last_day_of_month

    assert_equal 31, Date.new(2012, 7, 31).last_day_of_month

    assert_equal 31, Date.new(2012, 8, 31).last_day_of_month

    assert_equal 30, Date.new(2012, 9, 30).last_day_of_month

    assert_equal 31, Date.new(2012, 10, 31).last_day_of_month

    assert_equal 30, Date.new(2012, 11, 30).last_day_of_month

    assert_equal 31, Date.new(2012, 12, 31).last_day_of_month
  end

  def test_ending_of_month
    assert_equal Date.new(2012, 1, 31), Date.new(2012, 1, 1).ending_of_month

    assert_equal Date.new(2012, 2, 29), Date.new(2012, 2, 2).ending_of_month

    assert_equal Date.new(2012, 3, 31), Date.new(2012, 3, 1).ending_of_month

    assert_equal Date.new(2012, 4, 30), Date.new(2012, 4, 3).ending_of_month

    assert_equal Date.new(2012, 5, 31), Date.new(2012, 5, 1).ending_of_month

    assert_equal Date.new(2012, 6, 30), Date.new(2012, 6, 30).ending_of_month

    assert_equal Date.new(2012, 7, 31), Date.new(2012, 7, 1).ending_of_month

    assert_equal Date.new(2012, 8, 31), Date.new(2012, 8, 5).ending_of_month

    assert_equal Date.new(2012, 9, 30), Date.new(2012, 9, 2).ending_of_month

    assert_equal Date.new(2012, 10, 31), Date.new(2012, 10, 22).ending_of_month

    assert_equal Date.new(2012, 11, 30), Date.new(2012, 11, 10).ending_of_month

    assert_equal Date.new(2012, 12, 31), Date.new(2012, 12, 15).ending_of_month
  end

  def test_beginning_of_month
    assert_equal Date.new(2012, 1, 1), Date.new(2012, 1, 31).beginning_of_month

    assert_equal Date.new(2012, 2, 1), Date.new(2012, 2, 29).beginning_of_month

    assert_equal Date.new(2012, 3, 1), Date.new(2012, 3, 31).beginning_of_month

    assert_equal Date.new(2012, 4, 1), Date.new(2012, 4, 30).beginning_of_month

    assert_equal Date.new(2012, 5, 1), Date.new(2012, 5, 31).beginning_of_month

    assert_equal Date.new(2012, 6, 1), Date.new(2012, 6, 30).beginning_of_month

    assert_equal Date.new(2012, 7, 1), Date.new(2012, 7, 31).beginning_of_month

    assert_equal Date.new(2012, 8, 1), Date.new(2012, 8, 31).beginning_of_month

    assert_equal Date.new(2012, 9, 1), Date.new(2012, 9, 30).beginning_of_month

    assert_equal Date.new(2012, 10, 1), Date.new(2012, 10, 31).beginning_of_month

    assert_equal Date.new(2012, 11, 1), Date.new(2012, 11, 30).beginning_of_month

    assert_equal Date.new(2012, 12, 1), Date.new(2012, 12, 31).beginning_of_month
  end

  def test_all_sundays_in_month
    assert_equal [6, 13, 20, 27], Date.new(2013, 1, 1).all_sundays_in_month
    assert_equal [3, 10, 17, 24], Date.new(2013, 2, 1).all_sundays_in_month
  end

  def test_all_mondays_in_month
    assert_equal [7, 14, 21, 28], Date.new(2013, 1, 1).all_mondays_in_month
    assert_equal [4, 11, 18, 25], Date.new(2013, 2, 1).all_mondays_in_month
  end

  def test_all_tuesdays_in_month
    assert_equal [1, 8, 15, 22, 29], Date.new(2013, 1, 1).all_tuesdays_in_month
    assert_equal [5, 12, 19, 26], Date.new(2013, 2, 1).all_tuesdays_in_month
  end

  def test_all_wednesdays_in_month
    assert_equal [2, 9, 16, 23, 30], Date.new(2013, 1, 1).all_wednesdays_in_month
    assert_equal [6, 13, 20, 27], Date.new(2013, 2, 1).all_wednesdays_in_month
  end

  def test_all_thursdays_in_month
    assert_equal [3, 10, 17, 24, 31], Date.new(2013, 1, 1).all_thursdays_in_month
    assert_equal [7, 14, 21, 28], Date.new(2013, 2, 1).all_thursdays_in_month
  end

  def test_all_fridays_in_month
    assert_equal [4, 11, 18, 25], Date.new(2013, 1, 1).all_fridays_in_month
    assert_equal [1, 8, 15, 22], Date.new(2013, 2, 1).all_fridays_in_month
  end

  def test_all_saturdays_in_month
    assert_equal [5, 12, 19, 26], Date.new(2013, 1, 1).all_saturdays_in_month
    assert_equal [2, 9, 16, 23], Date.new(2013, 2, 1).all_saturdays_in_month
  end

  def test_name_of_month
    assert_equal 'January', Date.new(2012, 1, 1).name_of_month
    assert_equal 'February', Date.new(2012, 2, 1).name_of_month
    assert_equal 'March', Date.new(2012, 3, 1).name_of_month
    assert_equal 'April', Date.new(2012, 4, 1).name_of_month
    assert_equal 'May', Date.new(2012, 5, 1).name_of_month
    assert_equal 'June', Date.new(2012, 6, 1).name_of_month
    assert_equal 'July', Date.new(2012, 7, 1).name_of_month
    assert_equal 'August', Date.new(2012, 8, 1).name_of_month
    assert_equal 'September', Date.new(2012, 9, 1).name_of_month
    assert_equal 'October', Date.new(2012, 10, 1).name_of_month
    assert_equal 'November', Date.new(2012, 11, 1).name_of_month
    assert_equal 'December', Date.new(2012, 12, 1).name_of_month
  end
end
