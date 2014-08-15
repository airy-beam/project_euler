#Problem 62
#
#The cube, 41063625 (3453), can be permuted to produce two other cubes:
#56623104 (3843) and 66430125 (4053). In fact, 41063625 is the smallest
#cube which has exactly three permutations of its digits which are also cube.
#
#Find the smallest cube for which exactly five permutations of its digits are cube.

found = false
solution = 0
cubes_count = { }
k = 1
begin
  n = k * k * k
  digits_of_n = [ ]
  n.to_s.scan(/./).each { | digit | digits_of_n << digit.to_i }
  smallest_prime = 0
  digits_of_n.sort.reverse.each { | digit | smallest_prime = smallest_prime * 10 + digit }
  if cubes_count[ smallest_prime ] == nil then
    cubes_count[ smallest_prime ] = [ 1, n ]
  else
    cubes_count[ smallest_prime ][0] += 1
  end
  if cubes_count[ smallest_prime ][0] == 5 then
    found = true
    solution = cubes_count[ smallest_prime ][1]
  end
  k += 1
end until found
print solution, "\n"

#Brute force solution tried below:
#def fill_is_cube_cache(new_upper_boundary)
#  n = 0
#  begin
#    n = @@cubes_cache_upper_boundary_k ** 3
#    @@is_cube_cache[ n ] = true
#    @@cubes_cache_upper_boundary_k += 1
#  end until n > new_upper_boundary
#  @@cubes_cache_upper_boundary = n
#end
#
#def permute(permutation, current_depth)
#  last_digit = nil
#  if ( current_depth == @@permutation_len )
#      if ( permutation > @@cubes_cache_upper_boundary ) then
#        fill_is_cube_cache(permutation)
#      end
#      if ( @@is_cube_cache[ permutation ] )
#        @@count_cubic_permutations += 1
#      end
#  else
#    i = 0
#    while ( i < @@permutation_len )
#      if ( @@digits_of_n_taken[i] == 0 ) and
#          ( ( current_depth > 0 ) or ( current_depth == 0 and ( @@digits_of_n[ i ] != 0 ) ) )
#        if last_digit == @@digits_of_n[ i ]
#          i += 1
#          next
#        else
#          last_digit = @@digits_of_n[ i ]
#        end
#        @@digits_of_n_taken[i] = 1
#        permute( permutation * 10 + @@digits_of_n[ i ], current_depth + 1 )
#        @@digits_of_n_taken[i] = 0
#      end
#      i += 1
#    end
#  end
#end
#
#@@found = false
#solution = 0
#k = 1
#@@is_cube_cache = { }
#@@cubes_cache_upper_boundary = 0
#@@cubes_cache_upper_boundary_k = 0
#@@digits_of_n = [ ]
#@@digits_of_n_taken = [ ]
#begin
#  @@n = k * k * k
#
#  @@digits_of_n = [ ]
#  @@n.to_s.scan(/./).each { | digit | @@digits_of_n << digit.to_i }
#  n_length = @@digits_of_n.length
#  @@digits_of_n.sort!
#  0.upto( n_length - 1 ) { | i | @@digits_of_n_taken[ i ] = 0 }
#  @@count_cubic_permutations = 0
#  @@permutation_len = n_length
#  permute(0,0)
#  if 3 == @@count_cubic_permutations then
#    @@found = true
#    solution = @@n
#  end
#  k += 1
#end until @@found
#print solution, "\n"
