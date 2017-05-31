#!/bin/env ruby
# encoding: utf-8

# @author Sachin Singh

require 'test/unit'
RUBY_VERSION < '1.9' ? require('lib/week_of_month') : require_relative('../../../week_of_month')

class TestYearForTime < Test::Unit::TestCase
  def test_years_between_dates
    assert_equal 3, Time.years_between_dates(Time.new(2015, 11, 1), Time.new(2012, 11, 15))
  end
end
