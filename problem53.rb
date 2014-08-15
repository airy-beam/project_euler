#Problem 53
#
#There are exactly ten ways of selecting three from five, 12345:
#
#123, 124, 125, 134, 135, 145, 234, 235, 245, and 345
#
#In combinatorics, we use the notation, C(5,3) = 10.
#
#In general,
#C(n,r) = n! / (r! * (n - r)! )	

#It is not until n = 23, that a value exceeds one-million: C(23,10) = 1144066.
#How many, not necessarily distinct, values of  nCr, for 1 <= n <= 100, 
#are greater than one-million?

require 'lib/number'

def c(n, r)
  n.factorial / (r.factorial * (n-r).factorial)
end

count = 0
1.upto(100) { |n|
  1.upto(n) { |r|
    if c(n, r) > 1_000_000 then count += 1 end
  }
}

print count
