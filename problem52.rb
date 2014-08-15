#Problem 52
#
#It can be seen that the number, 125874, and its double, 251748, 
#contain exactly the same digits, but in a different order.
#
#Find the smallest positive integer, x, such that 
#2x, 3x, 4x, 5x, and 6x, contain the same digits.

n = 1
while true do
  single = n.to_s.scan(/./).sort.to_s
  double = (2 * n).to_s.scan(/./).sort.to_s
  triple = (3 * n).to_s.scan(/./).sort.to_s
  quadruple = (4 * n).to_s.scan(/./).sort.to_s
  quintuple = (5 * n).to_s.scan(/./).sort.to_s
  sextuple = (6 * n).to_s.scan(/./).sort.to_s
  if (single == double &&
      single == triple &&
      single == quadruple &&
      single == quintuple &&
      single == sextuple) then
    print n
    break
  end
  n += 1  
end
