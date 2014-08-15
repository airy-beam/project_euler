#Problem 14
#
#The following iterative sequence is defined for the set of positive integers:
#n -> n/2 (n is even)
#n -> 3n + 1 (n is odd)
#
#Using the rule above and starting with 13, we generate 
#the following sequence:
#13  40  20  10  5  16  8  4  2  1
#It can be seen that this sequence (starting at 13 and 
#finishing at 1) contains 10 terms. Although it has not been 
#proved yet (Collatz Problem), it is thought that all 
#starting numbers finish at 1.
#
#Which starting number, under one million, produces the longest chain?

def DetermineLength(number)
    count = 1
    while (number != 1) do
      if (number % 2 == 0)
          number = number / 2
      else
          number = number * 3 + 1
      end
      count+=1;
    end
    count
end

max = 0
x = 0
1.upto(999999) do |n|
  l = DetermineLength(n)
  if l > max
    max = l
    x = n
  end
end

print x
