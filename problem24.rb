#Problem 24
#
#A permutation is an ordered arrangement of objects. For example, 
#3124 is one possible permutation of the digits 1, 2, 3 and 4. 
#If all of the permutations are listed numerically or alphabetically, 
#we call it lexicographic order. The lexicographic 
#permutations of 0, 1 and 2 are:
#
#012   021   102   120   201   210
#
#What is the millionth lexicographic permutation of 
#the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

@@digits =     [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
@@digit_took = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
PERMUTATION_LEN = 10
PERMUTATION_NEEDED = 1_000_000

def permute
  if ( @@pass.length == PERMUTATION_LEN ) 
    @@count += 1
    if (@@count == PERMUTATION_NEEDED)
      @@found_pass = @@pass
      @@success = true
    end
  else
    i = 0
    while ( ( !@@success ) && ( i < PERMUTATION_LEN ) )
      if ( @@digit_took[i] == 0 )
        @@digit_took[i] = 1
        @@pass = @@pass + @@digits[i].to_s
        permute()
        @@digit_took[i] = 0
        if ( 1 == @@pass.length )
          @@pass = ""
        else
          @@pass = @@pass[0..@@pass.length - 2]
        end
      end
      i += 1    
    end
  end
end

@@count = 0
@@success = false
@@pass = ""

permute()
print @@found_pass
