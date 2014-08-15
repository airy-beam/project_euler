#Problem 124
#
#The radical of n, rad(n), is the product of distinct 
#prime factors of n. For example, 504 = 2^3 * 3^2 * 7, so 
#rad(504) = 2 * 3 * 7 = 42.
#
#If we calculate rad(n) for 1 <= n <= 10, then sort them 
#on rad(n), and sorting on n if the radical values are equal, we get:
#
# n  rad(n)   k
# 1    1      1
# 2    2      2
# 4    2      3
# 8    2      4
# 3    3      5
# 9    3      6
# 5    5      7
# 6    6      8
# 7    7      9
# 10   10     10
# 
#Let E(k) be the k-th element in the sorted n column; 
#for example, E(4) = 8 and E(6) = 9.
#
#If rad(n) is sorted for 1 <= n <= 100000, find E(10000).


require "Mathn"

class Fixnum
  def rad
    product = 1
    self.prime_division.each { |number| product *= number[0] }
    product
  end
end

def compare(a, b)
  if a[1] > b[1] then return 1 end
  if a[1] < b[1] then return -1 end
  if a[0] > b[0] then return 1 end
  return -1
end

N = 100000
table = []
1.upto(N) { |n|  table << [n, n.rad] }
table = table.sort { |a, b| compare(a, b) }

print table[10_000 - 1][0]