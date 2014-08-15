#Problem 60
#
#The primes 3, 7, 109, and 673, are quite remarkable. 
#By taking any two primes and concatenating them in any order 
#the result will always be prime. 
#For example, taking 7 and 109, both 7109 and 1097 are prime. 
#The sum of these four primes, 792, represents the lowest sum 
#for a set of four primes with this property.
#
#Find the lowest sum for a set of five primes for which 
#any two primes concatenate to produce another prime.

require "lib/number.rb"
require "mathn"

class Integer
  def concatenate_with(another_number)
    self * ( 10 ** Math::log10(another_number + 1).ceil ) + another_number
  end
end

def go(primes_starting_position, count_of_primes_placed)
  if count_of_primes_placed >= 5 then
    @@found = true
    sum = 0
    0.upto( @@five_primes.size - 1 ) { | i |
      sum += @@five_primes[ i ]
      #print @@five_primes[ i ], " "
    }
    @@found_sum = sum
  else
    primes_starting_position.upto( @@primes_array_size - 1 ) { | primes_array_pos |
      candidate_prime = @@primes_array[ primes_array_pos ]
      this_number_satisfies = true
      i = 0
      until count_of_primes_placed == i or
            this_number_satisfies == false do
        first_merged_number = @@five_primes[ i ].concatenate_with( candidate_prime )
        if @@primes_hash[ first_merged_number ] == nil then
          @@primes_hash[ first_merged_number ] = first_merged_number.is_prime?
        end
        if @@primes_hash[ first_merged_number ] then
          second_merged_number = candidate_prime.concatenate_with( @@five_primes[ i ] )
          if @@primes_hash[ second_merged_number ] == nil then
            @@primes_hash[ second_merged_number ] = second_merged_number.is_prime?
          end
          if not ( @@primes_hash[ second_merged_number ] ) then
             this_number_satisfies = false
          end
        else
          this_number_satisfies = false
        end
        i += 1
      end
      if this_number_satisfies and not @@found then
        @@five_primes[ count_of_primes_placed ] = candidate_prime
        go( primes_array_pos + 1, count_of_primes_placed + 1 )
      end
    }
  end
end

@@primes_array = [ ]
@@primes_array_size = 0
@@primes_hash = { }
@@five_primes = [ ]
batch_size = 1_500
consider_this_prime = 3

@@found = false
@@found_sum = 0

until @@found do
  count = 0
  until count == batch_size do
    if consider_this_prime.is_prime? then
      @@primes_array << consider_this_prime
      @@primes_hash[ consider_this_prime ] = true
      count += 1
    else
      @@primes_hash[ consider_this_prime ] = false
    end
    consider_this_prime += 1
  end
  @@primes_array_size += batch_size
  go(0, 0)
end  

print @@found_sum, "\n"

