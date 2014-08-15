#Problem 97
#
#The first known prime found to exceed one million digits was 
#discovered in 1999, and is a Mersenne prime of the form 2^(6972593)−1; 
#it contains exactly 2,098,960 digits. Subsequently other Mersenne primes, 
#of the form 2^(p)−1, have been found which contain more digits.
#
#However, in 2004 there was found a massive non-Mersenne prime which 
#contains 2,357,207 digits: 28433×2^(7830457)+1.
#
#Find the last ten digits of this prime number.

def two_to_power_last_digits(power)
  cur_number = 1
  1.upto(power) { |p| 
    product = (cur_number * 2).to_s
    if ( product.length <= 10 ) then
      cur_number = product.to_i
    else
      cur_number = (product[product.length - 10..product.length - 1]).to_i
    end
  }
  cur_number
end

last_digits = (28433 * two_to_power_last_digits(7830457) + 1).to_s
print last_digits[last_digits.length - 10..last_digits.length - 1], "\n"
