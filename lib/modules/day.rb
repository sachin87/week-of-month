module WeekOfMonth
  module Day

    def days_array
      day = self.beginning_of_month.wday
      array = []
      array[day] = 1
      (2..self.end_of_month.mday).each {|i| array << i }
      array
    end

   def name_of_week_day
     self.class.new(year,month,day).strftime('%A')
   end
   
  end
end