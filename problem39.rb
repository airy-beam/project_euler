#Problem 39
#
#If p is the perimeter of a right angle triangle with 
#integral length sides, {a,b,c}, there are exactly three 
#solutions for p = 120.
#
#{20,48,52}, {24,45,51}, {30,40,50}
#
#For which value of p <= 1000, is the number of solutions maximised?

max_solutions, max_p = 0
1.upto(999) { |p|
  number_of_solutions = 0
  1.upto(p) { |a|
    (a + 1).upto(p) { |b| 
      perimeter = a + b + Math::sqrt(a*a + b*b)
      if perimeter > p then break end
      if perimeter == p then
        number_of_solutions += 1
      end
    }
  }
  if (number_of_solutions > max_solutions) then
    max_solutions = number_of_solutions
    max_p = p
  end
}
print max_p
