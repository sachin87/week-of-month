# @author Sachion Singh

RUBY_VERSION < '1.9' ? require('modules/constant') : require_relative('constant')

module WeekOfMonth
  module Week
    include WeekOfMonth::Constant

    # returns week of month for a given date
    # Date.new(2012,11,15).week_of_month
    #   => 3
    # @return [Fixnum]
    def week_of_month
      week_split.each_with_index do |o, i|
        return (i + 1) if o.include?(day)
      end
    end

    # November week_split would like this
    # [[nil, nil, nil, nil, nil, 1, 2],
    #  [3, 4, 5, 6, 7, 8, 9],
    #  [10, 11, 12, 13, 14, 15, 16],
    #  [17, 18, 19, 20, 21, 22, 23],
    #  [24, 25, 26, 27, 28, 29, 30]]
    #
    # The First Day of week decide its month of week.
    # The W1 Nov should be Nov 3 - Nov 9
    #
    # Date.new(2012,11,15).general_week_of_month
    #   => 2
    #
    # Date.new(2013,11,3).general_week_of_month
    #   => 1
    # @return [Fixnum]
    def general_week_of_month
      if week_split.first.first.nil?
        week_of_month - 1
      else
        week_of_month
      end
    end

    # checks whether the given day lies in first week of month
    # Date.new(2012,11,1).first_week?
    #   => true
    # @return [Boolean]
    def first_week?
      week_split[0].include?(day)
    end

    # checks whether the given day lies in second week of month
    # Date.new(2012,11,8).second_week?
    #   => true
    # @return [Boolean]
    def second_week?
      week_split[1].include?(day)
    end

    # checks whether the given day lies in last week of month
    # Date.new(2012,11,8).last_week?
    #   => false
    # @return [Boolean]
    def last_week?
      week_split.last.include?(day)
    end

    # returns total number of weeks in month
    # Date.new(2012,11,8).total_weeks
    #   => 5
    # @return [Fixnum]
    def total_weeks
      week_split.size
    end

    # checks whether the given day is saturday or sunday.
    # Date.new(2012,11,8).week_end?
    #   => false
    # @return [Boolean]
    def week_end?
      saturday? || sunday?
    end

    # checks whether the given day is not saturday or sunday.
    # Date.new(2012,11,8).working_day?
    #   => true
    # @return [Boolean]
    def working_day?
      !week_end?
    end

    # returns week split of the month for the given date
    # example-
    # Optional argument to change first week day to Monday
    # Date.new(2012,1,1).week_split       -> Sunday is first week day
    #   => [[1, 2, 3, 4, 5, 6, 7],
    #       [8, 9, 10, 11, 12, 13, 14],
    #       [15, 16, 17, 18, 19, 20, 21],
    #       [22, 23, 24, 25, 26, 27, 28],
    #       [29, 30, 31]
    # Date.new(2012,1,1).week_split(true) -> Monday is first week day
    #   => [[nil,nil,nil,nil,nil,nil,1],
    #       [2, 3, 4, 5, 6, 7, 8],
    #       [9, 10, 11, 12, 13, 14, 15],
    #       [16, 17, 18, 19, 20, 21, 22],
    #       [23, 24, 25, 26, 27, 28, 29],
    #       [30, 31]
    # @return [Array]
    def week_split
      days_array.each_slice(7).to_a
    end

    # this code generates method like 'week_of_month_eng', 'week_of_month_fr' etc.
    # Date.new(2012,11,15).week_of_month_in_eng
    #   => 'Third'
    # Date.new(2012,11,30).week_of_month_in_fr
    #   => "Cinquième"
    # @return [String]
    constants.select { |x| x.to_s.match('WEEK_OF_MONTH_IN_') }.each do |const|
      define_method(const.to_s.downcase) do
        eval "#{const}[week_of_month]"
      end
    end

    # it returns days past in the week
    # Date.new(2012,11,15).days_past_in_week
    #   => 4
    # Time.new(2012,11,30).days_past_in_week
    #   => 5
    # @return [Fixnum]
    def days_past_in_week
      to_date.cwday
    end

    # it returns days left in the week
    # Date.new(2012,11,15).days_left_in_week
    #   => 3
    # Time.new(2012,11,30).days_left_in_week
    #   => 2
    # @return [Fixnum]
    def days_left_in_week
      7 - days_past_in_week
    end

    # it returns date of the first day(sunday) of the week
    # Date.new(2012,11,15).starting_of_week
    #   => #<Date: 2012-11-12 ((2456244j,0s,0n),+0s,2299161j)>
    # Time.new(2012,11,30).starting_of_week
    #   => 2012-11-29 23:59:55 +0530
    # @return [Date || Time]
    def starting_of_week
      self.class.new(year, month, current_week.detect { |i| !i.nil? })
    end

    # it returns date of the last day(saturday) of the week
    # Date.new(2012,11,15).ending_of_week
    #   => #<Date: 2012-11-19 ((2456251j,0s,0n),+0s,2299161j)>
    # Time.new(2012,11,30).ending_of_week
    #   => 2012-11-30 00:00:02 +0530
    # @return [Date || Time]
    def ending_of_week
      if current_week.index(day) == 6
        self.class.new(year, month, current_week.last)
      elsif current_week.index(day) < 6
        if self.class == Date
          self +  (6 -  current_week.index(day))
        elsif self.class == Time
          self +  (60 * 60 * 24 * (6 - current_week.index(day)))
        end
      end
    end

    # it returns date of the next week day.
    # Date.new(2012,11,15).next_week
    #   => #<Date: 2012-11-22 ((2456254j,0s,0n),+0s,2299161j)>
    # Time.new(2012,11,30).next_week
    #   => 2012-11-30 00:00:07 +0530
    # @return [Date || Time]
    def next_week
      if self.class == Date
        self + 7
      elsif self.class == Time
        self + (60 * 60 * 24 * 7)
      end
    end

    # it returns date of the previous week day.
    # Date.new(2012,11,15).previous_week
    #   => #<Date: 2012-11-08 ((2456240j,0s,0n),+0s,2299161j)>
    # Time.new(2012,11,30).previous_week
    #   => 2012-11-29 23:59:53 +0530
    # @return [Date || Time]
    def previous_week
      if self.class == Date
        self - 7
      elsif self.class == Time
        self - (60 * 60 * 24 * 7)
      end
    end

    # it returns array of days in current week.
    # Date.new(2013,1,13).current_week
    # => [7, 8, 9, 10, 11, 12, 13]
    # @return [Array]
    def current_week
      week_split.select { |c| c.include?(day) }.flatten
    end
  end
end
