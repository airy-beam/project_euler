#Problem 48
#
#The series, 1 ^ 1 + 2 ^ 2 + 3 ^ 3 + ... + 10 ^ 10 = 10405071317.
#
#Find the last ten digits of the series, 
#1 ^ 1 + 2 ^ 2 + 3 ^ 3 + ... + 1000 ^ 1000.

sum = 0
1.upto(1000) do |n|
  sum += n**n
end

print sum.to_s[sum.to_s.length-10, 10]