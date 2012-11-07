# @author Sachin Singh

module WeekOfMonth
  module Year
    
    module ClassMethods
      # @param[Date,Date]
      # Date.years_between_date(Date.new(2015,11,1),Date.new(2012,11,15))
      #   => 3
      # @param[Time,Time]
      # Time.years_between_date(Time.new(2015,11,1),Time.new(2012,11,15))
      #   => 3
      # @return [Fixnum]
      def years_between_date(date1,date2)
        (date1.year - date2.year).abs
      end
    end
        
  end
end