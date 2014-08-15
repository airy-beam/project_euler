#Problem 92
#
#A number chain is created by continuously adding the square of the digits 
#in a number to form a new number until it has been seen before.
#
#For example,
#
#44 → 32 → 13 → 10 → 1 → 1
#85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89
#
#Therefore any chain that arrives at 1 or 89 will become stuck in an 
#endless loop. What is most amazing is that EVERY starting number will eventually arrive at 1 or 89.
#
#How many starting numbers below ten million will arrive at 89?

square = { 48 => 0, 49 => 1, 50 => 4, 51 => 9, 52 => 16, 53 => 25, 
              54 => 36, 55 => 49, 56 => 64, 57 => 81 }

n = 0
count = 0
until 9_999_999 == n
  n += 1
  term = n
  while ( term != 1 ) and ( term != 89)
    new_term = 0
    #term_s = term.to_s
    #0.upto(term_s.length - 1) { |i| new_term += square[term_s[i]] }
    term.to_s.each_byte { |byte| new_term += square[byte] }
    term = new_term
    #print term, " "
  end

  if 89 == term then count += 1 end

  #if n % 100000 == 0 then print n / 10_000_0, "\n" end
end

print count, "\n"
