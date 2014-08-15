#Problem 7
#
#By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, 
#we can see that the 6th prime is 13.
#
#What is the 10001st prime number?

require "lib/number"

n = 2
k = 1
while true
  if n.is_prime? then k += 1 end
  if k == 10001 then print n; break; end;
  n += 1
end
