#Problem 41
#
#We shall say that an n-digit number is pandigital if it makes use 
#of all the digits 1 to n exactly once. For example, 2143 is a 4-digit 
#pandigital and is also prime.
#
#What is the largest n-digit pandigital prime that exists?

require "lib/number"

@@digits =     [ 9, 8, 7, 6, 5, 4, 3, 2, 1 ]
@@digit_took = [ 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
@@num_len = 9

def permute
  if ( @@number.to_s.length == @@num_len ) 
    @@count += 1
    if @@number.is_prime? then 
      @@success = true
      print @@number, "\n"
    end
  else
    i = 0
    while ( ( !@@success ) && ( i < @@num_len ) )
      if ( @@digit_took[i] == 0 )
        @@digit_took[i] = 1
        prev_pass = @@number
        @@number = @@number * 10 + @@digits[i]
        permute()
        @@digit_took[i] = 0
        @@number = prev_pass
      end
      i += 1    
    end
  end
end

@@count = 0
@@success = false
@@number = 0

while (!@@success)
  permute()
  0.upto(9) { |i| @@digit_took[i] == 0 }
  @@num_len -= 1
  @@digits.shift
end

