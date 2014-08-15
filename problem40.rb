#Problem 40
#
#An irrational decimal fraction is created by 
#concatenating the positive integers:
#
#0.123456789101112131415161718192021...
#
#It can be seen that the 12th digit of the fractional part is 1.
#
#If d(n) represents the nth digit of the fractional part, 
#find the value of the following expression.
#
#d(1) * d(10) * d(100) * d(1000) * d(10000) * d(100000) * d(1000000)

d = {}
i = 1
n = 1
until i > 1_000_000 do
  start_index = i
  end_index = i + n.to_s.size - 1
  start_index.upto(end_index) { |t|
    if [1, 10, 100, 1000, 10000, 100000, 1000000].index(t) then
      d[t] = n.to_s[t - i..t - i].to_i
    end
  }
  i += n.to_s.size
  n += 1
end

product = 1
d.each { |key, value| product *= value }
print product
