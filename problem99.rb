#Comparing two numbers written in index form like 2^(11) and 3^(7) 
#is not difficult, as any calculator would confirm that 
#2^(11) = 2048 < 3^(7) = 2187.
#
#However, confirming that 632382^(518061) > 519432^(525806) 
#would be much more difficult, as both numbers contain over
#three million digits.
#
#Using base_exp.txt (right click and 'Save Link/Target As...'), 
#a 22K text file containing one thousand lines with a base/exponent 
#pair on each line, determine which line number has the greatest numerical value.
 
class ExponentNumber
  include Comparable
  attr :base
  attr :exp
  
  def initialize(base, exponent)
    @base, @exp = base, exponent
  end
  
  def <=>(rhs) 
    comp1 = self.exp * Math::log(self.base) / Math::log(rhs.base)
    comp2 = rhs.exp

    if comp1 > comp2 then
      res = 1
    else 
      if comp1 < comp2 then
        res = -1
      else
        res = 0
      end
    end
    
    if rhs.base < 1 then return -res; end
    return res
  end
  
end

class ExponentNumberContainer
  include Comparable
  attr :exponent_number
  attr :line_number
  
  def initialize(exponent_number, line_number)
    @exponent_number = exponent_number
    @line_number = line_number
  end
  
  def <=>(rhs)
    return self.exponent_number <=> rhs.exponent_number
  end
  
end

numbers = [ ]
f_numbers = File.new("input/base_exp.txt")
line_number = 1
until f_numbers.eof do
  line = f_numbers.gets
  number_elements = line.split(",")
  numbers << ExponentNumberContainer.new(
    ExponentNumber.new( number_elements[0].to_i, number_elements[1].to_i ), 
    line_number
  )
  line_number += 1
end
numbers.sort!
print numbers[ numbers.size - 1].line_number, "\n"
