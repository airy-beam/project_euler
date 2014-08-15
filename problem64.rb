#Problem 64
#
#All square roots are periodic when written as continued fractions 
#and can be written in the form:
#<...>
#It can be seen that the sequence is repeating. For conciseness, 
#we use the notation √23 = [4;(1,3,1,8)], 
#to indicate that the block (1,3,1,8) repeats indefinitely.
#The first ten continued fraction representations of (irrational) square roots are:
#
#√2=[1;(2)], period=1
#√3=[1;(1,2)], period=2
#√5=[2;(4)], period=1
#√6=[2;(2,4)], period=2
#√7=[2;(1,1,1,4)], period=4
#√8=[2;(1,4)], period=2
#√10=[3;(6)], period=1
#√11=[3;(3,6)], period=2
#√12= [3;(2,6)], period=2
#√13=[3;(1,1,1,1,6)], period=5
#
#Exactly four continued fractions, for N ≤ 13, have an odd period.
#
#How many continued fractions for N ≤ 10000 have an odd period?

TARGET = 10_000
#we take 20 numbers as one block of continued fraction representations
ITERATION = 20        
count = 0
n = 1
begin
  #if n % 500 == 0 then print n, "\n" end
  
  if (Math::sqrt(n).floor ** 2 != n)
    a = 1
    b = Math::sqrt(n).floor
    numbers = [ ]
    
    begin
      #Solution is based on the identity:
      #a / (sqrt(n) - b) = 
      #= entier + ( sqrt(n) + (( b ** 2 - n ) * entier / a + b ) ) / ( ( n - b ** 2 ) / a )
      #where
      #entier = (a * ( Math::sqrt(n) + b ) / ( n - b ** 2 )).floor
      
      ITERATION.times {
        entier = (a * ( Math::sqrt(n) + b ) / ( n - b ** 2 )).floor
        next_a = ( n - b ** 2 ) / a
        b = - (( b ** 2 - n ) * entier / a + b )
        a = next_a
        numbers << entier
      }
      
      period = 0
      begin
        period += 1
        period_proved = true
        0.upto( period - 1 ) { |base|
          checking_position = base
          begin
            if numbers[ base ] != numbers[ checking_position ] then period_proved = false end
            checking_position += period
          end until checking_position > numbers.size - 1
        }
      end until ( period_proved ) || ( period * 2 > numbers.size )
      
      if ( period_proved ) && ( period * 2 < numbers.size ) && ( period.modulo(2) == 1 ) then 
        count += 1
      end
    end until ( period_proved ) && ( period * 2 < numbers.size )
  end
  n += 1
end until n > TARGET
print count, "\n"
