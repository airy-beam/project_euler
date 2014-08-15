require 'mathn'

class Integer
  def divisors
    res=[1]
    2.upto(Math.sqrt(self).floor) do |i|
      if self % i == 0
        res << i
      end
    end
    res.reverse.each do |i|
      if ( self / i != i ) then res << self / i end
    end
    res
  end
  
  def number_of_divisors
    self.divisors.size
  end
  
  def sum_of_divisors
    sum = 0
    self.divisors.each { |n| sum += n }
    sum
  end
  
  def is_prime?
    if self<=0 then return false; end
    if self==1 then return false; end
    if self==2 then return true; end
    2.upto(Math::sqrt(self).ceil) { |n| if self % n == 0 then return false; end }
    return true;
  end
  
  def coprime?(b)
    if (self.divisors & b.divisors ).size == 1 then true else false end
  end
  
  #returns greatest common divisor of a and b
  def my_GCD(other)
    if (self == 0) then return other; end
    if (other == 0) then return self; end
    if (self == other) then return self; end
    if (self == 1 || other == 1) then return 1; end
    if ((self % 2 == 0) && (other % 2 == 0)) 
      return 2 * (self / 2).my_GCD(other / 2);
    end
    if ((self % 2 == 0) && (other % 2 != 0)) 
      return (self / 2).my_GCD(other);
    end
    if ((self % 2 != 0) && (other % 2 == 0)) 
      return self.my_GCD(other / 2);
    end
    return other.my_GCD((self - other).abs);
  end
  
  def totient
    #The totient  of a positive integer n is defined to be 
    #the number of positive integers less than n that are coprime to n.
    
    count = 0
    1.upto(self) { |i| if self.coprime?(i) then count += 1 end }
    count
  end
  
  def is_abundant?
    if self.sum_of_divisors - self > self then true else false end
  end
  
  def is_triangle?
    n = 0.0
    n = (-1/2) + 1/2 * Math::sqrt(1 + 8 * self)
    if n.integer? then true else false end
  end
  
  def factorial
    result = 1
    1.upto(self) { |n| result *= n }
    result
  end

end
