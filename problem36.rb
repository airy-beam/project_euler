#Problem 36
#
#The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.
#
#Find the sum of all numbers, less than one million, which are 
#palindromic in base 10 and base 2.

sum = 0

1.upto(999999) do |n|
  if n == n.to_s.reverse.to_i && n.to_s(2).to_i == n.to_s(2).reverse.to_i then 
    sum += n
  end
end

print sum
