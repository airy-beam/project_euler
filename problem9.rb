#Problem 9
#
#A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
#a^2 + b^2 = c^2
#For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
#
#There exists exactly one Pythagorean triplet for which a + b + c = 1000.
#Find the product abc.

1.upto(1000) { |a|
  1.upto(1000) { |b| 
      if (a + b + Math::sqrt(a*a + b*b) == 1000) then
        p = (a * b * Math::sqrt(a*a + b*b))
        print p.to_i
        exit
      end
  }
}
