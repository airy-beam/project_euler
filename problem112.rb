#Problem 112
#
#Working from left-to-right if no digit is exceeded by the digit to its 
#left it is called an increasing number; for example, 134468.
#
#Similarly if no digit is exceeded by the digit to its right it is 
#called a decreasing number; for example, 66420.
#
#We shall call a positive integer that is neither increasing nor decreasing 
#a "bouncy" number; for example, 155349.
#
#Clearly there cannot be any bouncy numbers below one-hundred, but just 
#over half of the numbers below one-thousand (525) are bouncy. In fact, 
#the least number for which the proportion of bouncy numbers first 
#reaches 50% is 538.
#
#Surprisingly, bouncy numbers become more and more common and by the time 
#we reach 21780 the proportion of bouncy numbers is equal to 90%.
#
#Find the least number for which the proportion of bouncy numbers is exactly 99%.

class Fixnum
  
  def is_bouncy?
    digits = []
    self.to_s.each_byte { |digit| digits << digit.chr.to_i }
    
    is_increasing = true
    1.upto(digits.size - 1) { |i| 
      if digits[i] < digits[i-1] then 
        is_increasing = false
        break
      end
    }
    if is_increasing then return false end
    
    is_decreasing = true
    1.upto(digits.size - 1) { |i| 
      if digits[i] > digits[i-1] then 
        is_decreasing = false
        break
      end
    }
    if is_decreasing then return false end
    
    return true
  end
  
end

count, proportion, n = 0, 0, 0
until ( proportion == 0.99 ) do
  n += 1
  if n.is_bouncy? then count += 1 end
  proportion = count.to_f / n
end

print n