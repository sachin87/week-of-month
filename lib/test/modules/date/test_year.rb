#!/bin/env ruby
# encoding: utf-8

# @author Sachin Singh

require 'test/unit'
RUBY_VERSION < '1.9' ? require('lib/week_of_month') : require_relative('../../../week_of_month')

class TestYearForDate < Test::Unit::TestCase
  def test_years_between_dates
    assert_equal 3, Date.years_between_dates(Date.new(2015, 11, 1), Date.new(2012, 11, 15))
  end
end
