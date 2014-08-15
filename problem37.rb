#Problem 37
#
#The number 3797 has an interesting property. Being prime itself, 
#it is possible to continuously remove digits from left to right, 
#and remain prime at each stage: 3797, 797, 97, and 7. Similarly 
#we can work from right to left: 3797, 379, 37, and 3.
#
#Find the sum of the only eleven primes that are both truncatable 
#from left to right and right to left.

require 'lib/number'

class Integer
  
  def is_truncatable?
    from_left = self
    from_right = from_left  
    len = self.to_s.length
    str = self.to_s

    #truncatable number can't contain even digits
    #digit 2 is possible because number 2 is even prime
    if ( str.to_s.index("0") ) then return false end
    if ( str.to_s.index("4") ) then return false end
    if ( str.to_s.index("6") ) then return false end
    if ( str.to_s.index("8") ) then return false end
    
    len.times {
      if (not from_left.is_prime?) || ( not from_right.is_prime?)
        return false
      end
      str = from_left.to_s
      from_left = (str[1..str.length]).to_i
      str = from_right.to_s
      from_right = (str[0..str.length - 2]).to_i
    }
    return true
  end
  
end

sum = 0 
count = 0
n = 11
while ( count < 11 ) 
  if n.is_truncatable?
    sum += n
    count += 1
    #print n, "\n"
  end
  n += 2
end
print sum, "\n"
