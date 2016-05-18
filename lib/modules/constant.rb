#!/bin/env ruby
# encoding: utf-8

# @author Sachin Singh

module WeekOfMonth
  module Constant
    # hash containing english words from one to seven
    WEEK_OF_MONTH_IN_ENG = { 1 => 'First', 2 => 'Second', 3 => 'Third',
                             4 => 'Fourth', 5 => 'Fifth', 6 => 'Sixth', 7 => 'Seventh' }.freeze

    # hash containing french words from one to seven
    WEEK_OF_MONTH_IN_FR  = { 1 => 'First', 2 => 'Second', 3 => 'Third',
                             4 => 'Quatrième', 5 => 'Cinquième', 6 => 'sixième', 7 => 'septième' }.freeze

    # hash containing german words from one to seven
    WEEK_OF_MONTH_IN_GER = { 1 => 'First', 2 => 'Second', 3 => 'Dritten',
                             4 => 'Vierte', 5 => 'Fünfte', 6 => 'Sechste', 7 => 'siebte' }.freeze

    # hash containing japneese words from one to seven
    WEEK_OF_MONTH_IN_JAP = { 1 => '最初', 2 => '秒', 3 => 'サード',
                             4 => '第4回', 5 => '第五', 6 => 'シックス', 7 => '第7' }.freeze

    # hash containing month name with days in that month(in non leap yaer)
    MONTH_WITH_DAY = { january: 31, february: 28, march: 31,
                       april: 30, may: 31, june: 30, july: 31,
                       august: 31, september: 30, october: 31,
                       november: 30, december: 31 }.freeze

    # hash containing month names with their sequence
    MONTH_WITH_SEQUENCE = { january: 1, february: 2, march: 3,
                            april: 4, may: 5, june: 6, july: 7,
                            august: 8, september: 9, october: 10,
                            november: 11, december: 12 }.freeze

    # array of days names ordered starting with sunday and ending with saturday.
    DAYS_IN_SEQUENCE = %w(Sunday Monday Tuesday Wednesday Thursday Friday
                          Saturday).freeze
  end
end
