#Problem 77
#
#It is possible to write ten as the sum of primes in exactly five 
#different ways:
#
#7 + 3
#5 + 5
#5 + 3 + 2
#3 + 3 + 2 + 2
#2 + 2 + 2 + 2 + 2
#
#What is the first value which can be written as the sum of primes in over five 
#thousand different ways?

require 'lib/number.rb'

def how_many_ways(which_number, sum, lowest_candidate) 
  if (sum == which_number)
    $count += 1
  else
    if (sum < which_number)
      $possible_primes.each { |candidate| 
        if ( ( sum + candidate <= which_number ) && ( candidate >= lowest_candidate ) )
          how_many_ways(which_number, sum + candidate, candidate)
        end
      }
    end
    if (sum > which_number)
      return
    end
  end
end

current_number = 1
$possible_primes = []
found = false
found_number = 0

until found
  if ( current_number.is_prime? )
    $possible_primes << current_number;    
  end

  $count = 0
  how_many_ways(current_number, 0, 0);

  if $count > 5_000 
    found = true
    found_number = current_number
  end
  
  current_number += 1
end

if ( found )
  print found_number;
end
