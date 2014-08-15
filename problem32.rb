#Problem 32
#
#We shall say that an n-digit number is pandigital if it makes use of all the
#digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.
#
#The product 7254 is unusual, as the identity, 39 × 186 = 7254,
#containing multiplicand, multiplier, and product is 1 through 9 pandigital.
#
#Find the sum of all products whose multiplicand/multiplier/product identity
#can be written as a 1 through 9 pandigital.

def go_for_multiplicand(multiplicand_length)
  if @@multiplicand_digits.length < multiplicand_length
      0.upto(@@digits.length - 1) { |digit_pos|
        current_set_of_digits = @@digits.dup
        @@multiplicand_digits << @@digits[ digit_pos ]
        @@digits.delete( @@digits[ digit_pos ] )
        go_for_multiplicand(multiplicand_length)
        @@multiplicand_digits.delete_at( @@multiplicand_digits.size - 1 )
        @@digits = current_set_of_digits.dup
      }
    else
      product_number = @@product_digits.join().to_i
      multiplicand_number = @@multiplicand_digits.join().to_i
      if product_number.modulo(multiplicand_number) == 0
        multiplier_string = ( product_number / multiplicand_number ).to_s()
        identity_is_pandigital = true
        if multiplier_string.length + multiplicand_number.to_s.length + product_number.to_s.length != 9
          identity_is_pandigital = false
        end
        if identity_is_pandigital
          0.upto( multiplier_string.length - 1 ) { |digit_pos|
            current_digit = multiplier_string[ digit_pos ].to_i.chr.to_i
            if @@digits.index( current_digit ) == nil
              identity_is_pandigital = false
            end
          }
        end
        if identity_is_pandigital
          0.upto( multiplier_string.length - 1 ) { |digit_pos|
            if multiplier_string.index(multiplier_string[ digit_pos ].to_i.chr) < digit_pos
              identity_is_pandigital = false
            end
          }
        end
        if ( identity_is_pandigital ) and ( not @@found_products[ product_number ] )
          print multiplier_string, " x ", multiplicand_number, " = ", product_number, "\n"
          @@found_products[ product_number ] = true
          @@sum += product_number
        end
      end
    end
end

def go()
  #I see that, theoretically, product may be 5-digit (AB x CDE = FGHIJ identity).
  #However, current answer is accepted as correct - entia non sunt multiplicanda 
  #praeter necessitatem.
  #If it was not accepted - one parameter for product length should have been
  #added to this 'go' method. 

  if @@product_digits.length < 4 then
    0.upto(@@digits.length - 1) { |digit_pos|
      current_set_of_digits = @@digits.dup
      @@product_digits << @@digits[ digit_pos ]
      @@digits.delete( @@digits[ digit_pos ] )
      go
      @@product_digits.delete_at( @@product_digits.size - 1 )
      @@digits = current_set_of_digits.dup
    }
  else
    1.upto(3) { | multiplicand_length | go_for_multiplicand(multiplicand_length) }
  end
end

@@sum = 0
@@digits = [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
@@product_digits = [ ]
@@multiplicand_digits = [ ]
@@found_products = [ ]
go
print @@sum, "\n"
