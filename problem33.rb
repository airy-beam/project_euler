#Problem 33
#
#The fraction 49/98 is a curious fraction, as an inexperienced 
#mathematician in attempting to simplify it may incorrectly 
#believe that 49/98 = 4/8, which is correct, is obtained by 
#cancelling the 9s.
#
#We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
#
#There are exactly four non-trivial examples of this type of fraction, 
#less than one in value, and containing two digits in the numerator 
#and denominator.
#
#If the product of these four fractions is given in its lowest 
#common terms, find the value of the denominator.


require 'Mathn'
require 'lib/string'

def unorthodox(m, n)
  m_s = m.to_s
  n_s = n.to_s
  i = 0
  until (i == m_s.length) do
    j = 0
    until (j == n_s.length) do
      if m_s[i] == n_s[j] then
        cancels = true
        m_s = m_s.delete_at(i)
        n_s = n_s.delete_at(j)
        i -= 1
        j -= 1
      end
      j += 1
    end
    i += 1
  end
  
  if cancels && (m.to_f / n.to_f == m_s.to_f / n_s.to_f) then
    true
  else
    false
  end
end

product_of_nominators = 1
product_of_denominators = 1
10.upto(99) { |m|
  (m + 1).upto(99) { |n|
    if unorthodox(m, n) && !(m % 10 == 0 && n % 10 == 0) then
      product_of_nominators *= m
      product_of_denominators *= n
    end
  }
}

print product_of_denominators / (product_of_nominators.gcd2(product_of_denominators) )
