#Problem 51
#
#By replacing the 1st digit of *3, it turns out that six of the nine possible
#values: 13, 23, 43, 53, 73, and 83, are all prime.
#
#By replacing the 3rd and 4th digits of 56**3 with the same digit,
#this 5-digit number is the first example having seven primes among the ten
#generated numbers, yielding the family:
#56003, 56113, 56333, 56443, 56663, 56773, and 56993.
#Consequently 56003, being the first member of this family,
#is the smallest prime with this property.
#
#Find the smallest prime which, by replacing part of the number
#(not necessarily adjacent digits) with the same digit,
#is part of an eight prime value family.

require 'lib/number.rb'

def replace_with_same_digit( number, star_positions, digit )
  new_number_str = ""
  0.upto( number.length - 1 ) { | position |
    if ( star_positions[ position ] )
      new_number_str.concat( digit )
    else
      new_number_str.concat( number[ position ] )
    end
  }
  new_number_str.to_i
end

def generate_combinations( length_of_number, number_of_stars, stars_left, start_position )
  if 0 == stars_left
    count_of_primes, count_of_non_primes = 0, 0
    if @@star_positions[0] then digit = 1 else digit = 0 end
    until ( count_of_non_primes > @@max_non_primes ) or ( digit > 9 ) do
      next_number = replace_with_same_digit(@@current_number_s, @@star_positions, digit.to_s )
      if ( @@is_prime[ next_number ] ) or ( next_number.is_prime? )
        @@is_prime[ next_number ] = true
        count_of_primes += 1
      else
        count_of_non_primes += 1
      end
      if @@target_count == count_of_primes
        @@found = true
        if @@star_positions[0] then digit = 1 else digit = 0 end
        @@smallest_number = replace_with_same_digit(@@current_number_s, @@star_positions, digit.to_s )
      end
      digit += 1
    end
  else
    start_position.upto( length_of_number - stars_left ) { | new_star_position |
      if not @@star_positions[ new_star_position ]
        prev_star_positions = @@star_positions.dup
        @@star_positions[ new_star_position ] = true
        generate_combinations( length_of_number, number_of_stars, stars_left - 1, new_star_position + 1 )
        @@star_positions = prev_star_positions.dup
      end
    }
  end
end

@@target_count = 8
@@max_non_primes = 10 - @@target_count
@@found = false
@@is_prime = { }

current_number = 1
until @@found do
  @@current_number_s = current_number.to_s
  @@star_positions = Array.new
  if current_number.is_prime?
    @@is_prime[ current_number ] = true
    1.upto( @@current_number_s.length - 1 ) { | number_of_stars |
      generate_combinations( @@current_number_s.length, number_of_stars, number_of_stars, 0 )
    }
  end
  current_number += 2 
end

print @@smallest_number, "\n"
