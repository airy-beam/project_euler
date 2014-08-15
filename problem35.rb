#Problem 35
#
#The number, 197, is called a circular prime because all 
#rotations of the digits: 197, 971, and 719, are themselves prime.
#
#There are thirteen such primes below 100: 
#2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
#
#How many circular primes are there below one million?

require 'lib/number'

class Integer
  
  def is_circular?
    n = self
    if ( n.to_s.index("0") ) then return false end
    len = n.to_s.length
    len.times {
      if (not n.is_prime?)
        return false
      end
      str = n.to_s
      n = (str[1..str.length] + str[0..0]).to_i
    }
    return true
  end
  
end

count = 1     #to account for 2, which is the only even prime number
n = 1
while ( n < 1_000_000 ) 
  if n.is_circular?
    count += 1
  end
  n += 2
end
print count
