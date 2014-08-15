#Problem 27
#
#Euler published the remarkable quadratic formula:
#
#n^2 + n + 41
#
#It turns out that the formula will produce 40 primes for 
#the consecutive values n = 0 to 39. However, 
#when n = 40, 40^2 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41,
#and certainly when n = 41, 41? + 41 + 41 is clearly divisible by 41.
#
#Using computers, the incredible formula  n^2 - 79n + 1601 was discovered, 
#which produces 80 primes for the consecutive values n = 0 to 79. 
#The product of the coefficients, 79 and 1601, is 126479.
#
#Considering quadratics of the form:
#
#n? + an + b, where |a| < 1000 and |b| < 1000,
#find the product of the coefficients, a and b, 
#for the quadratic expression that produces the maximum number of primes 
#for consecutive values of n, starting with n = 0.

require 'lib/number'

found_a, found_b, max_number = 0, 0, 0
-999.upto(999) { |a|
  -999.upto(999) { |b|
    n, count = 0, 0
    while (n*n + a*n + b).is_prime?
      n += 1
      count += 1
    end
    if count > max_number then
      found_a, found_b, max_number = a, b, count
    end
  }
}

print found_a * found_b
#Answer: a = -61, b = 971, a * b = -59231, n = 71
