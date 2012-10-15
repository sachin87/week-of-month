#!/bin/env ruby
# encoding: utf-8

module WeekOfMonth
  module Constant
    WEEK_IN_ENG = { 1 => 'First', 2 => 'Second', 3 => 'Third',
                    4 => 'Fourth', 5 => 'Fifth', 6 => 'Sixth'}

    WEEK_IN_FR  = { 1 => 'First', 2 => 'Second', 3 => 'Third',
                    4 => 'Quatrième', 5 => 'Cinquième', 6 => 'sixième'}

    WEEK_IN_GER = { 1 => 'First', 2 => 'Second', 3 => 'Dritten',
                    4 => 'Vierte', 5 => 'Fünfte', 6 => 'Sechste'}

    WEEK_IN_JAP = { 1=>'最初', 2 =>'秒', 3 =>'サード',
                    4=> '第4回', 5 =>'第五', 6=> 'シックス'}

    MONTH_WITH_DAY = { :january => 31, :february => 28, :march => 31,
                       :april => 30, :may => 31, :june => 30, :july => 31,
                       :august => 31, :september => 30, :october => 31,
                       :november => 30, :december => 31 }

    MONTH_WITH_SEQUENCE = { :january => 1, :february => 2, :march => 3,
                            :april => 4, :may => 5, :june => 6, :july => 7,
                            :august => 8, :september => 9, :october => 10,
                            :november => 11, :december => 12 }
  end
end