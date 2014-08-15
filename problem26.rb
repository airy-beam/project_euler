#Problem 26
#
#A unit fraction contains 1 in the numerator. The decimal representation of
#the unit fractions with denominators 2 to 10 are given (...)
#
#Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle.
#It can be seen that 1/7 has a 6-digit recurring cycle.
#
#Find the value of d < 1000 for which 1/d contains the longest
#recurring cycle in its decimal fraction part.

longest_cycle_length = 0
number_with_longest_cycle = 0

2.upto(1000 - 1) { | current_denominator |
  decimal_fraction_part = [ ]
  dividends = [ ]
  dividends << ( current_dividend = 10 )
  current_position = 1
  begin
    decimal_fraction_part << ( current_dividend / current_denominator )
    dividends << ( current_dividend = current_dividend.modulo( current_denominator ) * 10 )
    current_position += 1
  end until ( ( prev_occurrence = dividends.index( current_dividend ) ) < current_position - 1 ) or
            ( current_dividend == 0 ) 

  if prev_occurrence < current_position - 1
    current_cycle_length = current_position - prev_occurrence - 1
    if current_cycle_length > longest_cycle_length
      longest_cycle_length = current_cycle_length
      number_with_longest_cycle = current_denominator
    end
  else
    current_cycle_length = 0
  end

#  print current_denominator, " 0."
#  0.upto(prev_occurrence - 1) { |print_pos|
#    print decimal_fraction_part[print_pos]
#  }
#  if current_cycle_length != 0
#    print "("
#    (prev_occurrence).upto(current_position - 2) { |print_pos|
#      print decimal_fraction_part[print_pos]
#    }
#    print ")"
#  end
#  print "\n"
}

print number_with_longest_cycle, "\n"
