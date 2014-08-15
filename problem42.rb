#Problem 42
#
#The n-th term of the sequence of triangle numbers is given by, 
#t(n) = 1/2 * n * (n+1); so the first ten triangle numbers are:
#
#1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#
#By converting each letter in a word to a number 
#corresponding to its alphabetical position and adding 
#these values we form a word value. For example, 
#the word value for SKY is 19 + 11 + 25 = 55 = t(10). 
#If the word value is a triangle number then we shall call 
#the word a triangle word.
#
#Using words.txt, a 16K text file containing nearly two-thousand 
#common English words, how many are triangle words?

require 'lib/number'

class String
  def worth
    sum = 0
    alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    self.to_s.scan(/./).each { |n| sum += (alphabet.index(n) + 1) }
    sum
  end
end

fwords = File.new("input/words.txt")
words = fwords.gets.split(/[,]+/)
0.upto(words.size-1) do |i|
  words[i] = words[i][1,words[i].size-2]
end

count = 0
words.each { |w| if w.worth.is_triangle? then count += 1 end }
print count
