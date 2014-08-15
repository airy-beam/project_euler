#Problem 47
#
#The first two consecutive numbers to have two distinct prime factors are:
#
#14 = 2 * 7
#15 = 3 * 5
#
#The first three consecutive numbers to have three distinct prime factors are:
#
#644 = 2 ^ 2 *  7 * 23
#645 = 3 * 5 * 43
#646 = 2 * 17 * 19.
#
#Find the first four consecutive integers to have four distinct primes 
#factors. What is the first of these numbers?

require "Mathn"
NecessaryDivisors = 4

n = 1
while true
  if n.prime_division.size == NecessaryDivisors and
     (n+1).prime_division.size == NecessaryDivisors and
     (n+2).prime_division.size == NecessaryDivisors and
     (n+3).prime_division.size == NecessaryDivisors then
    print n
    break
  end
  n += 1
end
