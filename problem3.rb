#Problem 3
#
#The prime factors of 13195 are 5, 7, 13 and 29.
#What is the largest prime factor of the number 600851475143 ?

require "Mathn"

N = 600_851_475_143
print N.prime_division.max[0]
