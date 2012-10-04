#!/bin/env ruby
# encoding: utf-8

# TODO SUPPORT for time class object

require 'date'
require 'time'
require_relative 'week_helper' 

class Date
  include WeekHelper
end

class Time
  include WeekHelper
end