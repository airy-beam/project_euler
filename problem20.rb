#Problem 20
#
#n! means n * (n - 1) * ... * 3 * 2 * 1
#
#Find the sum of the digits in the number 100!

require "lib/number"

sum = 0
100.factorial.to_s.scan(/./).each { |n| sum += n.to_i }
print sum
