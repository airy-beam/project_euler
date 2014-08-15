#Problem 46
#
#It was proposed by Christian Goldbach that every odd composite number 
#can be written as the sum of a prime and twice a square.
#
#9 = 7 + 2×1^(2)
#15 = 7 + 2×2^(2)
#21 = 3 + 2×3^(2)
#25 = 7 + 2×3^(2)
#27 = 19 + 2×2^(2)
#33 = 31 + 2×1^(2)
#
#It turns out that the conjecture was false.
#
#What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?

require "lib/number.rb"

found = false
primes = [ 2 ]
n = 3
begin
  if n.is_prime? then
    primes << n
  else
    i = 0
    confirmed_conjecture = false
    begin
      t = ( n - primes[ i ] ) / 2
      if ( Math::sqrt(t).floor ** 2 ) == t then
        #print n, " can be expressed as ", primes[ i ],  " + 2 * " , Math::sqrt(t) , " ^ 2\n"
        confirmed_conjecture = true
      end
      i += 1
    end until ( confirmed_conjecture ) || ( i == primes.size )
    if ( not confirmed_conjecture ) then
      print n, "\n"
      found = true
    end
  end
  n += 2
end until found
