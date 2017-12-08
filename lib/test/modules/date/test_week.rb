#!/bin/env ruby
# encoding: utf-8

require 'test/unit'
RUBY_VERSION < '1.9' ? require('lib/week_of_month') : require_relative('../../../week_of_month')

class TestWeekForDate < Test::Unit::TestCase
  def test_week_of_month
    assert_equal 5, Date.new(2013, 1, 31).week_of_month

    assert_equal 5, Date.new(2013, 2, 28).week_of_month

    assert_equal 6, Date.new(2013, 3, 31).week_of_month

    assert_equal 5, Date.new(2013, 4, 30).week_of_month

    assert_equal 5, Date.new(2013, 5, 31).week_of_month

    assert_equal 6, Date.new(2013, 6, 30).week_of_month

    assert_equal 5, Date.new(2013, 7, 31).week_of_month

    assert_equal 5, Date.new(2013, 8, 31).week_of_month

    assert_equal 5, Date.new(2013, 9, 30).week_of_month

    assert_equal 5, Date.new(2013, 10, 31).week_of_month

    assert_equal 5, Date.new(2013, 11, 30).week_of_month

    assert_equal 5, Date.new(2013, 12, 31).week_of_month
  end

  def test_general_week_of_month
    assert_equal 4, Date.new(2013, 1, 31).general_week_of_month

    assert_equal 4, Date.new(2013, 2, 28).general_week_of_month

    assert_equal 5, Date.new(2013, 3, 31).general_week_of_month

    assert_equal 4, Date.new(2013, 4, 30).general_week_of_month

    assert_equal 4, Date.new(2013, 5, 31).general_week_of_month

    assert_equal 5, Date.new(2013, 6, 30).general_week_of_month

    assert_equal 4, Date.new(2013, 7, 31).general_week_of_month

    assert_equal 4, Date.new(2013, 8, 31).general_week_of_month

    assert_equal 5, Date.new(2013, 9, 30).general_week_of_month

    assert_equal 4, Date.new(2013, 10, 31).general_week_of_month

    assert_equal 4, Date.new(2013, 11, 30).general_week_of_month

    assert_equal 5, Date.new(2013, 12, 31).general_week_of_month
  end

  def test_week_split
    object = Date.new(2013, 1, 10)
    split_for_january = [[nil, nil, 1, 2, 3, 4, 5],
                         [6, 7, 8, 9, 10, 11, 12],
                         [13, 14, 15, 16, 17, 18, 19],
                         [20, 21, 22, 23, 24, 25, 26],
                         [27, 28, 29, 30, 31]]
    assert_kind_of Array, object.week_split
    assert_equal split_for_january, object.week_split

    object = Date.new(2013, 2, 15)
    split_for_october = [[nil, nil, nil, nil, nil, 1, 2],
                         [3, 4, 5, 6, 7, 8, 9],
                         [10, 11, 12, 13, 14, 15, 16],
                         [17, 18, 19, 20, 21, 22, 23],
                         [24, 25, 26, 27, 28]]
    assert_kind_of Array, object.week_split
    assert_equal split_for_october, object.week_split
  end

  def test_first_week?
    assert Date.new(2012, 1, 1).first_week?
    assert !Date.new(2012, 1, 31).first_week?
  end

  def test_second_week?
    assert Date.new(2013, 1, 6).second_week?
    assert !Date.new(2013, 1, 2).second_week?
  end

  def test_last_week?
    assert Date.new(2012, 10, 31).last_week?
    assert !Date.new(2012, 10, 20).last_week?
  end

  def test_total_weeks
    assert_equal 5, Date.new(2012, 10, 31).total_weeks
    assert_equal 6, Date.new(2012, 12, 20).total_weeks
  end

  def test_week_of_month_in_eng
    assert_equal 'First', Date.new(2012, 12, 1).week_of_month_in_eng
    assert_equal 'Second', Date.new(2012, 12, 4).week_of_month_in_eng
    assert_equal 'Third', Date.new(2012, 12, 9).week_of_month_in_eng
    assert_equal 'Fourth', Date.new(2012, 12, 16).week_of_month_in_eng
    assert_equal 'Fifth', Date.new(2012, 12, 24).week_of_month_in_eng
    assert_equal 'Sixth', Date.new(2012, 12, 31).week_of_month_in_eng
  end

  def test_week_of_month_in_fr
    assert_equal 'Premier', Date.new(2012, 12, 1).week_of_month_in_fr
    assert_equal 'Deuxième', Date.new(2012, 12, 4).week_of_month_in_fr
    assert_equal 'Troisième', Date.new(2012, 12, 9).week_of_month_in_fr
    assert_equal 'Quatrième', Date.new(2012, 12, 16).week_of_month_in_fr
    assert_equal 'Cinquième', Date.new(2012, 12, 24).week_of_month_in_fr
    assert_equal 'Sixième', Date.new(2012, 12, 31).week_of_month_in_fr
  end

  def test_week_of_month_in_ger
    assert_equal 'First', Date.new(2012, 12, 1).week_of_month_in_ger
    assert_equal 'Second', Date.new(2012, 12, 4).week_of_month_in_ger
    assert_equal 'Dritten', Date.new(2012, 12, 9).week_of_month_in_ger
    assert_equal 'Vierte', Date.new(2012, 12, 16).week_of_month_in_ger
    assert_equal 'Fünfte', Date.new(2012, 12, 24).week_of_month_in_ger
    assert_equal 'Sechste', Date.new(2012, 12, 31).week_of_month_in_ger
  end

  def test_week_of_month_in_ja
    assert_equal '第一', Date.new(2012, 12, 1).week_of_month_in_ja
    assert_equal '第二', Date.new(2012, 12, 4).week_of_month_in_ja
    assert_equal '第三', Date.new(2012, 12, 9).week_of_month_in_ja
    assert_equal '第四', Date.new(2012, 12, 16).week_of_month_in_ja
    assert_equal '第五', Date.new(2012, 12, 24).week_of_month_in_ja
    assert_equal '第六', Date.new(2012, 12, 31).week_of_month_in_ja
  end

  def test_week_end?
    assert !Date.new(2012, 10, 1).week_end?
    assert !Date.new(2012, 10, 31).week_end?
    assert Date.new(2012, 10, 6).week_end?
    assert Date.new(2012, 10, 7).week_end?
  end

  def test_working_day?
    assert Date.new(2012, 10, 1).working_day?
    assert Date.new(2012, 10, 31).working_day?
    assert !Date.new(2012, 10, 6).working_day?
    assert !Date.new(2012, 10, 7).working_day?
  end

  def test_days_past_in_week
    assert_equal 2, Date.new(2013, 1, 1).days_past_in_week
  end

  def test_days_left_in_week
    assert_equal 5, Date.new(2013, 1, 1).days_left_in_week
  end

  def test_starting_of_week
    assert_equal Date.new(2012, 11, 25), Date.new(2012, 11, 25).starting_of_week
    assert_equal Date.new(2012, 11, 25), Date.new(2012, 11, 26).starting_of_week
    assert_equal Date.new(2012, 11, 25), Date.new(2012, 11, 30).starting_of_week
  end

  def test_ending_of_week
    assert_equal Date.new(2012, 12, 1), Date.new(2012, 12, 1).ending_of_week
    assert_equal Date.new(2012, 12, 8), Date.new(2012, 12, 2).ending_of_week
    assert_equal Date.new(2012, 12, 8), Date.new(2012, 12, 3).ending_of_week
    assert_equal Date.new(2012, 12, 8), Date.new(2012, 12, 7).ending_of_week
  end

  def test_next_week
    assert_equal Date.new(2012, 12, 8), Date.new(2012, 12, 1).next_week
    assert_equal Date.new(2012, 12, 22), Date.new(2012, 12, 15).next_week
    assert_equal Date.new(2013, 1, 5), Date.new(2012, 12, 29).next_week
    assert_equal Date.new(2012, 12, 26), Date.new(2012, 12, 19).next_week
  end

  def test_previous_week
    assert_equal Date.new(2012, 12, 1), Date.new(2012, 12, 8).previous_week
    assert_equal Date.new(2012, 12, 15), Date.new(2012, 12, 22).previous_week
    assert_equal Date.new(2012, 12, 29), Date.new(2013, 1, 5).previous_week
    assert_equal Date.new(2012, 12, 19), Date.new(2012, 12, 26).previous_week
  end

  def test_monday_configured_starting_of_week
    WeekOfMonth.configuration.monday_active = true
    assert_equal Date.new(2012, 11, 19), Date.new(2012, 11, 25).starting_of_week
    assert_equal Date.new(2012, 11, 26), Date.new(2012, 11, 26).starting_of_week
    assert_equal Date.new(2012, 11, 26), Date.new(2012, 11, 30).starting_of_week
    WeekOfMonth.configuration.monday_active = false
  end

  def test_monday_configured_ending_of_week
    WeekOfMonth.configuration.monday_active = true
    assert_equal Date.new(2012, 12, 2), Date.new(2012, 12, 1).ending_of_week
    assert_equal Date.new(2012, 12, 2), Date.new(2012, 12, 2).ending_of_week
    assert_equal Date.new(2012, 12, 9), Date.new(2012, 12, 3).ending_of_week
    assert_equal Date.new(2012, 12, 9), Date.new(2012, 12, 7).ending_of_week
    WeekOfMonth.configuration.monday_active = false
  end
end
