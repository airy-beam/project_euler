#Problem 25
#
#The Fibonacci sequence is defined by the recurrence relation:
#F(n) = F(n-1) + F(n-2), where F(1) = 1 and F(2) = 1.

fibonacci = [1, 1]
i = 2
term = 0
while true do
  term = fibonacci[i-2] + fibonacci[i-1]
  fibonacci.push term
  if term.to_s.length == 1000 then print i+1; break; end
  i += 1
end 
