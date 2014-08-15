#Problem 50
#
#The prime 41, can be written as the sum of six consecutive primes:
#41 = 2 + 3 + 5 + 7 + 11 + 13
#
#This is the longest sum of consecutive primes that adds to
#a prime below one-hundred.
#
#The longest sum of consecutive primes below one-thousand that
#adds to a prime, contains 21 terms, and is equal to 953.
#
#Which prime, below one-million, can be written as the sum of
#the most consecutive primes?

require 'lib/number.rb'

upper_threshold = 1_000_000

primes = Array.new()
primes_hash = Hash.new()
1.upto(upper_threshold) { |n| 
  if n.is_prime? then
    primes << n
    primes_hash[ n ] = true
  end
}
number_of_primes = primes.size
largest_prime = primes[ number_of_primes - 1 ]

best_target_sum, best_length_of_primes_sequence, best_from, best_to = 0, 0, 0, 0
left_end_index = 0
until left_end_index == number_of_primes - best_length_of_primes_sequence
  sum = primes[ left_end_index ]
  right_end_index = left_end_index + 1
  until ( sum > largest_prime ) or ( right_end_index > number_of_primes - 1 )
    sum += primes[ right_end_index ]
    if primes_hash[ sum ] then
      length_of_primes_sequence = right_end_index - left_end_index + 1
      if length_of_primes_sequence > best_length_of_primes_sequence then
        best_target_sum = sum
        best_length_of_primes_sequence = length_of_primes_sequence
        best_from = primes[ left_end_index ]
        best_to = primes[ right_end_index ]
      end
    end
    right_end_index += 1
  end
  left_end_index += 1
end


print best_target_sum, " (", best_length_of_primes_sequence, " ", best_from, " ", best_to, ")\n"