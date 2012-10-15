require_relative 'constant'

module WeekOfMonth
  module Month

    include WeekOfMonth::Constant
    
    MONTH_WITH_DAY.keys.each do |month_name|
      define_method((month_name.to_s + '?').to_sym) do
        MONTH_WITH_SEQUENCE[month_name] == month
      end
    end

    def last_day_of_month
      if leap? && february?
        29
      else
        MONTH_WITH_DAY[MONTH_WITH_SEQUENCE.key(month)]
      end
    end

    def end_of_month
      self.class.new(year,month,last_day_of_month)
    end

    def beginning_of_month
      self.class.new(year,month,1)
    end

    def name_of_month
      self.class.new(year,month,day).strftime('%B')
    end

    Date::DAYNAMES.each_with_index do |day_name, i|
      method_name = "all_#{day_name.downcase}s_in_month".to_sym
      define_method(method_name) do
        week_split.map{|d| d[i] }.compact
      end
    end
    
  end
end