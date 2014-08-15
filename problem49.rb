#Problem 49
#
#The arithmetic sequence, 1487, 4817, 8147, in which each of the terms 
#increases by 3330, is unusual in two ways: (i) each of the three 
#terms are prime, and, (ii) each of the 4-digit numbers are permutations of 
#one another.
#
#There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, 
#exhibiting this property, but there is one other 4-digit increasing sequence.
#
#What 12-digit number do you form by concatenating the three terms in this sequence?

require "lib/number.rb"

def are_permutations(a, b, c)
  if ( a.to_s.scan(/./).sort.to_s == b.to_s.scan(/./).sort.to_s ) &&
     ( a.to_s.scan(/./).sort.to_s == c.to_s.scan(/./).sort.to_s )
    return true
  else
    return false
  end
end

primes = [ 0 ]

1000.upto(9999) { |n|
  if n.is_prime? then
    primes << n
  end
}

first_triplet = "148748178147"
found_other = false
first_index = 0
begin
  second_index = first_index + 1
  begin
    diff = primes[ second_index ] - primes[ first_index ]
    if primes.index( primes[ second_index ] + diff ) then
      if are_permutations( primes[ first_index ], primes[ second_index ], primes[ second_index ] + diff ) then
        triplet = primes[ first_index ].to_s + primes[ second_index ].to_s + ( primes[ second_index ] + diff ).to_s
        if triplet != first_triplet
          found_other = true
          print triplet
        end
      end
    end
    second_index += 1
  end until ( second_index == primes.size - 2 ) || found_other
  first_index += 1
  #if first_index % 10 == 0 then print first_index, "\n" end
end until ( first_index == primes.size - 3 ) || found_other
