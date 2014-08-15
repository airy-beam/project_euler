#Problem 38
#
#Take the number 192 and multiply it by each of 1, 2, and 3:
#
#    192 × 1 = 192
#    192 × 2 = 384
#    192 × 3 = 576
#
#By concatenating each product we get the 1 to 9 pandigital,
#192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)
#
#The same can be achieved by starting with 9 and multiplying by
#1, 2, 3, 4, and 5, giving the pandigital, 918273645,
#which is the concatenated product of 9 and (1,2,3,4,5).
#
#What is the largest 1 to 9 pandigital 9-digit number that can be
#formed as the concatenated product of an integer
#with (1,2, ... , n) where n > 1?

def satisfies(n)
  n_string = n.to_s()
  unless (9 == n_string.size) 
    false
  else
    satisfies = false
    1.upto(n_string.size) { |base_length|
      unless satisfies
      base = n_string[0..base_length - 1].to_i
        current_pos = base_length - 1
        factor = 2
        number_satisfies = true
        while ( current_pos < 8 ) and ( number_satisfies )
          product = (base * factor).to_s
          if ( product == n_string[ current_pos + 1 .. current_pos + product.length] )
            factor      += 1
            current_pos += product.length
          else
            number_satisfies = false
          end
          if number_satisfies then satisfies = true else satisfies = false end
        end
      end
    }
    satisfies
  end
end

def go()
  if not @@found
    if @@number_digits.length < 9 then
      0.upto(@@digits.length - 1) { |digit_pos|
        current_set_of_digits = @@digits.dup
        @@number_digits << @@digits[ digit_pos ]
        @@digits.delete( @@digits[ digit_pos ] )
        go
        @@number_digits.delete_at( @@number_digits.size - 1 )
        @@digits = current_set_of_digits.dup
      }
    else
      number = @@number_digits.join.to_i
      if satisfies(number)
        print number, "\n"
        @@found = true
      end
    end
  end
end

@@found = false
@@digits = [ 9, 8, 7, 6, 5, 4, 3, 2, 1 ]
@@number_digits = [ ]
go
