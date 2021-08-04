#!/bin/env ruby
# encoding: utf-8

require 'test/unit'
RUBY_VERSION < '1.9' ? require('lib/week_of_month') : require_relative('../../../week_of_month')

class TestConstantForDate < Test::Unit::TestCase
  def test_constants_present?
    assert Date::WEEK_OF_MONTH_IN_ENG

    assert Date::WEEK_OF_MONTH_IN_GER

    assert Date::WEEK_OF_MONTH_IN_FR

    assert Date::WEEK_OF_MONTH_IN_JA

    assert Date::MONTH_WITH_DAY

    assert Date::MONTH_WITH_SEQUENCE

    assert Date::DAYS_IN_SEQUENCE
  end

  def test_constants_value
    assert_equal({ 1 => 'First', 2 => 'Second',
                   3 => 'Third', 4 => 'Fourth',
                   5 => 'Fifth', 6 => 'Sixth',
                   7 => 'Seventh' }, Date::WEEK_OF_MONTH_IN_ENG)

    assert_equal({ 1 => 'Premier', 2 => 'Deuxième',
                   3 => 'Troisième', 4 => 'Quatrième',
                   5 => 'Cinquième', 6 => 'Sixième',
                   7 => 'Septième' }, Date::WEEK_OF_MONTH_IN_FR)

    assert_equal({ 1 => 'First', 2 => 'Second',
                   3 => 'Dritten', 4 => 'Vierte',
                   5 => 'Fünfte', 6 => 'Sechste',
                   7 => 'siebte' }, Date::WEEK_OF_MONTH_IN_GER)

    assert_equal({ 1 => '第一', 2 => '第二',
                   3 => '第三', 4 => '第四',
                   5 => '第五', 6 => '第六',
                   7 =>  '第七' }, Date::WEEK_OF_MONTH_IN_JA)

    assert_equal({ january: 1, february: 2, march: 3,
                   april: 4, may: 5, june: 6, july: 7,
                   august: 8, september: 9, october: 10,
                   november: 11, december: 12 }, Date::MONTH_WITH_SEQUENCE)

    assert_equal({ january: 31, february: 28, march: 31,
                   april: 30, may: 31, june: 30, july: 31,
                   august: 31, september: 30, october: 31,
                   november: 30, december: 31 }, Date::MONTH_WITH_DAY)

    assert_equal(%w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday],
                 Date::DAYS_IN_SEQUENCE)

    assert_equal(%w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday],
                 Date::DAYS_IN_SEQUENCE_STARTING_MONDAY)

    assert_equal(%w[Last First Second Third Fourth Fifth],
                 Date::WEEKS_IN_SEQUENCE)
  end
end
