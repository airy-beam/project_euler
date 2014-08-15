#Problem 56
#
#A googol (10 ^ 100) is a massive number: one followed by one-hundred zeros; 
#100 ^ 100 is almost unimaginably large: one followed by two-hundred zeros. 
#Despite their size, the sum of the digits in each number is only 1.
#
#Considering natural numbers of the form, a ^ b, where a, b < 100, 
#what is the maximum digital sum?

max_sum = nil
1.upto(99) do |x|
  1.upto(99) do |y|
    sum = 0
    (x ** y).to_s.scan(/./).each { |n| sum += n.to_i }
    if (max_sum == nil) || (sum > max_sum) then max_sum = sum end
  end
end

print max_sum
