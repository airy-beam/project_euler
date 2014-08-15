#Problem 5
#
#2520 is the smallest number that can be divided by each of the 
#numbers from 1 to 10 without any remainder.
#
#What is the smallest number that is evenly divisible by 
#all of the numbers from 1 to 20?

def divisible(number)
# There is no need to check all numbers from 1 to 20, since
# if the number can be divided by 12, it can also be divided by 3, 4, and 6
# if it can be divided by 14, it can be divided by 2 and 7, and so on.
# 10 and 20 can be skipped since we iterate with step 20

  11.upto(19) { |t| if number % t != 0 then return false; end }
  return true
end

n = 0
while true
  n += 20
  if divisible(n) then print n; break; end
end

