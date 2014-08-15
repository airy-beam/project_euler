#Problem 74
#
#The number 145 is well known for the property that the sum of the factorial 
#of its digits is equal to 145:
#
#1! + 4! + 5! = 1 + 24 + 120 = 145
#
#Perhaps less well known is 169, in that it produces the longest chain of 
#numbers that link back to 169; it turns out that there are only three such 
#loops that exist:
#
#169 → 363601 → 1454 → 169
#871 → 45361 → 871
#872 → 45362 → 872
#
#It is not difficult to prove that EVERY starting number will eventually get 
#stuck in a loop. For example,
#
#69 → 363600 → 1454 → 169 → 363601 (→ 1454)
#78 → 45360 → 871 → 45361 (→ 871)
#540 → 145 (→ 145)
#
#Starting with 69 produces a chain of five non-repeating terms, but the 
#longest non-repeating chain with a starting number below one million is 
#sixty terms.
#
#How many chains, with a starting number below one million, 
#contain exactly sixty non-repeating terms?

factorial = { 48 => 1, 49 => 1, 50 => 2, 51 => 6, 52 => 24, 53 => 120, 
              54 => 720, 55 => 5040, 56 => 40320, 57 => 362880 }

n = 0
count = 0
used_numbers = Hash.new
until 1_000_000 == n
  n += 1
  term = n
  count_terms = 1
  used_numbers.clear
  used_numbers[ term ] = true;
  not_repeating = true
  while not_repeating
    new_term = 0
    term.to_s.each_byte { |byte| new_term += factorial[byte] }

    if used_numbers[ new_term ] then 
      not_repeating = false  
    else
      used_numbers[ new_term ] = true
      term = new_term
      count_terms += 1
    end
  end

  if 60 == count_terms then count += 1 end

  #if n % 10000 == 0 then print n, "\n" end
end

print count, "\n"
