#Problem 17
#
#If the numbers 1 to 5 are written out in words: 
#one, two, three, four, five, then there are 
#3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
#If all the numbers from 1 to 1000 (one thousand) inclusive 
#were written out in words, how many letters would be used?

class Integer
  DIGITS = { 1 => "one", 2 => "two", 3 => "three", 4 => "four",
             5 => "five", 6 => "six", 7 => "seven",
             8 => "eight", 9 => "nine", 10 => "ten" }
  TEENS = { 11 => "eleven", 12 => "twelve", 13 => "thirteen",
            14 => "fourteen", 15 => "fifteen", 16 => "sixteen",
            17 => "seventeen", 18 => "eighteen", 19 => "nineteen" }
  TENS = { 2 => "twenty", 3 => "thirty", 4 => "forty", 5 => "fifty",
           6 => "sixty", 7 => "seventy", 8 => "eighty", 9 => "ninety" }
  
  def pronounce
    case self
    when 1..10: 
      return DIGITS[self]
      
    when 11..19: 
      return TEENS[self]
      
    when 20..99: 
      begin
        p = TENS[self / 10]
        if self % 10 != 0 then
          p += (" " + (self % 10).pronounce)
        end
        return p
      end
    
    when 100..999:
      begin
        p = DIGITS[self / 100] + " hundred"
        remainder = self - self / 100 * 100
        if remainder != 0 then
          p += (" and " + remainder.pronounce)
        end
        return p
      end
      
    when 1000:
      return "one thousand"
    end
  end
end

count = 0
1.upto(1000) {|i| count += i.pronounce.gsub(" ", "").size}
print count
