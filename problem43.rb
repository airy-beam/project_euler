#Problem 43
#
#The number, 1406357289, is a 0 to 9 pandigital number because it is 
#made up of each of the digits 0 to 9 in some order, but it also has 
#a rather interesting sub-string divisibility property.
#
#Let d_(1) be the 1^(st) digit, d_(2) be the 2^(nd) digit, and so on. 
#In this way, we note the following:
#
#    * d_(2)d_(3)d_(4)=406 is divisible by 2
#    * d_(3)d_(4)d_(5)=063 is divisible by 3
#    * d_(4)d_(5)d_(6)=635 is divisible by 5
#    * d_(5)d_(6)d_(7)=357 is divisible by 7
#    * d_(6)d_(7)d_(8)=572 is divisible by 11
#    * d_(7)d_(8)d_(9)=728 is divisible by 13
#    * d_(8)d_(9)d_(10)=289 is divisible by 17
#
#Find the sum of all 0 to 9 pandigital numbers with this property.

@@digits =     [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
@@digit_took = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
NUM_LEN = 10

def fits(n)
  s = n.to_s
  if ((s[2 - 1,1] + s[3 - 1,1] + s[4 - 1,1]).to_i % 2 != 0) then return false end
  if ((s[3 - 1,1] + s[4 - 1,1] + s[5 - 1,1]).to_i % 3 != 0) then return false end
  if ((s[4 - 1,1] + s[5 - 1,1] + s[6 - 1,1]).to_i % 5 != 0) then return false end
  if ((s[5 - 1,1] + s[6 - 1,1] + s[7 - 1,1]).to_i % 7 != 0) then return false end
  if ((s[6 - 1,1] + s[7 - 1,1] + s[8 - 1,1]).to_i % 11 != 0) then return false end
  if ((s[7 - 1,1] + s[8 - 1,1] + s[9 - 1,1]).to_i % 13 != 0) then return false end
  if ((s[8 - 1,1] + s[9 - 1,1] + s[10 - 1,1]).to_i % 17 != 0) then return false end
  return true
end

def permute
  if ( @@number.to_s.length == NUM_LEN ) 
    if fits(@@number) then 
      @@sum += @@number
    end
  else
    i = 0
    while ( i < NUM_LEN )
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

@@sum = 0
@@number = 0

permute()
print @@sum, "\n"

