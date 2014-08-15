class ExtendedDate
  attr_accessor :day, :month, :year
  
  def initialize(day, month, year)
    #check!
    @day, @month, @year = day, month, year
  end
  
  def ==(rhs)
    if @day == rhs.day && @month == rhs.month && @year == rhs.year then 
      true 
    else 
      false
    end
  end
  
  def is_leap?(year)
    if (year % 4 == 0 && ((year % 100 != 0) || (year % 400 == 0)))
      true
    else
      false
    end
  end
  
  def day_of_week
    a = (14 - @month)/12; 
    y = @year + 4800 - a; 
    m = @month + 12 * a - 3;
    (@day + (153*m + 2)/5 + 365*y + y/4 - y/100 + y/400 - 32045) % 7 + 1;
  end
  
  def tomorrow
    if (@month == 4 || @month == 6 || @month == 9 || @month == 11) then
      number_of_days = 30
    else 
      if (@month == 2) then 
        if (is_leap?(@year)) then number_of_days = 29 else number_of_days = 28 end
      else
        number_of_days = 31
      end
    end

    if @day < number_of_days then 
      day = @day + 1
      month = @month
      year = @year
    else 
      if (@day == number_of_days && @month != 12) then
        day = 1
        month = @month + 1
        year = @year
      else
        day = 1
        month = 1
        year = @year + 1
      end  
    end
    ExtendedDate.new(day, month, year)    
  end
  
  def tomorrow!
    t = self.tomorrow
    @day, @month, @year = t.day, t.month, t.year
  end
end
