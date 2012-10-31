module WeekOfMonth
  module Day
    
    # gives array of days in month
    # Date.new(2012,1,1).days_array
    #   => [nil, nil, nil, nil, 1, 2, 3,
    #        4, 5, 6, 7, 8, 9, 10, 11, 
    #        12, 13, 14, 15, 16, 17, 18,
    #        19, 20, 21, 22, 23, 24, 25,
    #        26, 27, 28, 29, 30]
    # @return [Array]
    def days_array
      day = self.beginning_of_month.wday
      array = []
      array[day] = 1
      (2..self.end_of_month.mday).each {|i| array << i }
      array
    end

   # Date.new(2012,11,1).name_of_week_day
   #   => 'Thursday'
   # @return [String]
   def name_of_week_day
     self.class.new(year,month,day).strftime('%A')
   end
   
   # Date.new(2012,11,1).days_between_date(Date.new(2012,11,15))
   #   => 45
   # @return [Fixnum]
   def days_between_date(date)
     self.day - date.day
   end
   
   # this code generates method names like 'upcomong_monday' and 'previous_monday'
   # Date.new(2012,11,1).upcoming_monday
   # => 
   # Date.new(2012,11,1).previous_monday
   # =>  
   { 'upcoming' => '+', 'previous' => '-'}.each_pair do |key,value|
     Date::DAYNAMES.each do |day_name|
       name = "#{key}_#{day_name}".to_sym
       check = "#{day_name}?".to_sym
       define_method(name) do
         date = eval "self"
         until date.send(check)
           date = date.send(value,1.day)
         end
         date
       end
     end
   end
   
  end
end