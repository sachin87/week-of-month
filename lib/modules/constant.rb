#!/bin/env ruby
# encoding: utf-8

# @author Sachin Singh

module WeekOfMonth
  module Constant
    # hash containing english words from one to seven
    WEEK_OF_MONTH_IN_ENG = { 1 => 'First', 2 => 'Second', 3 => 'Third',
                             4 => 'Fourth', 5 => 'Fifth', 6 => 'Sixth', 7 => 'Seventh' }.freeze

    # hash containing french words from one to seven
    WEEK_OF_MONTH_IN_FR  = { 1 => 'Premier', 2 => 'Deuxième', 3 => 'Troisième',
                             4 => 'Quatrième', 5 => 'Cinquième', 6 => 'Sixième', 7 => 'Septième' }.freeze

    # hash containing german words from one to seven
    WEEK_OF_MONTH_IN_GER = { 1 => 'First', 2 => 'Second', 3 => 'Dritten',
                             4 => 'Vierte', 5 => 'Fünfte', 6 => 'Sechste', 7 => 'siebte' }.freeze

    # hash containing japanese words from one to seven
    WEEK_OF_MONTH_IN_JA = { 1 => '第一', 2 => '第二', 3 => '第三',
                            4 => '第四', 5 => '第五', 6 => '第六', 7 =>  '第七' }.freeze

    # hash containing month name with days in that month(in non leap year)
    MONTH_WITH_DAY = { january: 31, february: 28, march: 31,
                       april: 30, may: 31, june: 30, july: 31,
                       august: 31, september: 30, october: 31,
                       november: 30, december: 31 }.freeze

    # hash containing month names with their sequence
    MONTH_WITH_SEQUENCE = { january: 1, february: 2, march: 3,
                            april: 4, may: 5, june: 6, july: 7,
                            august: 8, september: 9, october: 10,
                            november: 11, december: 12 }.freeze

    # array of ordered days names starting from sunday and ending with saturday.
    DAYS_IN_SEQUENCE = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday].freeze

    # array of ordered days names starting from sunday and ending with saturday.
    DAYS_IN_SEQUENCE_STARTING_MONDAY = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].freeze

    # array of ordered days names starting from sunday and ending with saturday.
    WEEKS_IN_SEQUENCE = %w[Last First Second Third Fourth Fifth].freeze
  end
end
