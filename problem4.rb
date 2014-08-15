#Problem 4
#
#A palindromic number reads the same both ways. The largest palindrome 
#made from the product of two 2-digit numbers is 9009 = 91  99.
#Find the largest palindrome made from the product of two 3-digit numbers.

largest = 0
100.upto(999) do |n1|
  100.upto(999) do |n2|
    if (n1*n2).to_s.reverse == (n1*n2).to_s then
      if n1*n2 > largest then largest = n1*n2 end
    end
  end
end
print largest
