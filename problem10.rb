#Problem 10
#
#The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
#Find the sum of all the primes below two million.

require "lib/number"

n = 2
sum = 2
until n >= 2_000_000 do
  if n.is_prime? then sum += n end
  n += 1
end

print sum
