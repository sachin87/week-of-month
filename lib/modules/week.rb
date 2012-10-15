require_relative 'constant'

module WeekOfMonth
  module Week

    include WeekOfMonth::Constant

    def week_of_month
      week_split.each_with_index do |o,i|
        return (i + 1) if o.include?(self.day)
      end
    end

    def first_week?
      week_split[0].include?((self.day))
    end

    def second_week?
      week_split[1].include?((self.day))
    end

    def last_week?
      week_split.last.include?((self.day))
    end

    def total_weeks
      week_split.size
    end

    def week_end?
      saturday? || sunday?
    end

    def working_day?
      !week_end?
    end

    def week_split
      days_array.each_slice(7).to_a
    end

    ['eng', 'fr', 'ger', 'jap'].each do |lang|
      method_name = "week_of_month_in_#{lang}"
      define_method(method_name) do
        eval "WEEK_IN_#{lang.upcase}[week_of_month]"
      end
    end

  end
end