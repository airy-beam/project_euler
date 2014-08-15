#Problem 65
#
#The square root of 2 can be written as an infinite continued fraction.
#√ 2 = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...
#
#The infinite continued fraction can be written, √2 = [1;(2)], 
#(2) indicates that 2 repeats ad infinitum. 
#In a similar way, √23 = [4;(1,3,1,8)].
#It turns out that the sequence of partial values of continued fractions 
#for square roots provide the best rational approximations. 
#Let us consider the convergents for √2.
#<...>
#Hence the sequence of the first ten convergents for √2 are:
#1, 3/2, 7/5, 17/12, 41/29, 99/70, 239/169, 577/408, 1393/985, 3363/2378, ...
#What is most surprising is that the important mathematical constant,
#e = [2; 1,2,1, 1,4,1, 1,6,1 , ... , 1,2k,1, ...].
#
#The first ten terms in the sequence of convergents for e are:
#2, 3, 8/3, 11/4, 19/7, 87/32, 106/39, 193/71, 1264/465, 1457/536, ...
#The sum of digits in the numerator of the 10th convergent is 1+4+5+7=17.
#
#Find the sum of digits in the numerator of the 100th
#convergent of the continued fraction for e.

target_convergent = 100
count = 0
#First generated term is 3, so we make adjustment by 1
convergent = target_convergent - 1
if ( convergent + 1 ).modulo(3) == 0 then
  numerator = ( convergent + 1 ) / 3 * 2
else
  numerator = 1
end
denominator = 1

convergent.downto(1) { |i|
  numerator, denominator = denominator, numerator
  if (i > 1) then
    if ( i ).modulo(3) == 0 then
      d = ( i ) / 3 * 2
    else
      d = 1
    end
  else
    d = 0
  end
  numerator += d * denominator
}
numerator += 2 * denominator

sum = 0
numerator.to_s.scan(/./).each { |digit| sum += digit.to_i }
print sum, "\n"

