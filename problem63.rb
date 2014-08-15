#Problem 63
#
#The 5-digit number, 16807=75, is also a fifth power. 
#Similarly, the 9-digit number, 134217728=89, is a ninth power.
#
#How many n-digit positive integers exist which are also an nth power?

largest_possible_power = 0
n = 0
while ( n.to_s.length >= largest_possible_power )
  largest_possible_power += 1
  n = 9 ** largest_possible_power
end

count = 0
1.upto( largest_possible_power ) { | power |
  1.upto(9) { | base |
    if ( ( base ** power ).to_s().length == power )
      count += 1
    end
  }
}

print count, "\n"
