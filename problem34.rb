#Problem 34
#
#145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
#
#Find the sum of all numbers which are equal to the sum 
#of the factorial of their digits.
#
#Note: as 1! = 1 and 2! = 2 are not sums they are not included.

factorial = { '0' => 1, '1' => 1, '2' => 2, '3' => 6, '4' => 24, '5' => 120, 
              '6' => 720, '7' => 5040, '8' => 40320, '9' => 362880 }

UPPER_LIMIT = 2_903_040

sum = 0
1.upto(UPPER_LIMIT) { |n|
  sum_fact_digits = 0
  n.to_s.scan(/./).each { |digit| sum_fact_digits += factorial[digit] }
  if n==sum_fact_digits then sum += n end
}

print sum - 3
