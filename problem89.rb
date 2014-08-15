#Problem 89
#
#The rules for writing Roman numerals allow for many ways of writing 
#each number (see FAQ: Roman Numerals). However, there is always 
#a "best" way of writing a particular number.

#For example, the following represent all of the legitimate ways 
#of writing the number sixteen:
#
#IIIIIIIIIIIIIIII
#VIIIIIIIIIII
#VVIIIIII
#XIIIIII
#VVVI
#XVI
#
#The last example being considered the most efficient, 
#as it uses the least number of numerals.
#
#The 11K text file, roman.txt (right click and 'Save Link/Target As...'), 
#contains one thousand numbers written in valid, but not necessarily 
#minimal, Roman numerals; that is, they are arranged in descending 
#units and obey the subtractive pair rule (see FAQ for the definitive 
#rules for this problem).
#
#Find the number of characters saved by writing each of 
#these in their minimal form.

ROMAN_DIGITS = [ [ 1000, "M" ], [ 900, "CM" ], [ 500, "D" ], [ 400, "CD" ],
                 [ 100, "C" ], [ 90, "XC" ], [ 50, "L" ], [ 40, "XL"],
                 [ 10, "X" ], [ 9, "IX" ], [ 5, "V" ], [ 4, "IV" ], [ 1, "I" ] ]
               
def arabic_to_roman(number)
  result = ""
  0.upto(ROMAN_DIGITS.size - 1) { |i|
    while ( number >= ROMAN_DIGITS[i][0] ) 
      number -= ROMAN_DIGITS[i][0]
      result += ROMAN_DIGITS[i][1]
    end
  }
  result
end

def roman_to_arabic(number)
  result = 0
  i = 0
  while ( i < number.length )
    j = 0
    while ( number[i, ROMAN_DIGITS[j][1].length ] !=  ROMAN_DIGITS[j][1] )
      j += 1
    end
    result += ROMAN_DIGITS[j][0]
    i += ROMAN_DIGITS[j][1].length
  end
  result
end

can_be_saved = 0
f_roman = File.new("input/roman.txt")
all = ""
until f_roman.eof do
  roman = f_roman.gets.strip
  initial_length = roman.length
  arabic = roman_to_arabic(roman)
  roman = arabic_to_roman(arabic)
  new_length = roman.length
  can_be_saved += ( initial_length - new_length )
end

print can_be_saved, "\n"
