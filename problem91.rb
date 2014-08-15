#Problem 91
#
#The points P (x_(1), y_(1)) and Q (x_(2), y_(2)) are plotted 
#at integer co-ordinates and are joined to the origin, O(0,0), to form ΔOPQ.
#
#There are exactly fourteen triangles containing a right angle that can be 
#formed when each co-ordinate lies between 0 and 2 inclusive; that is,
#0 ≤ x_(1), y_(1), x_(2), y_(2) ≤ 2.
#
#Given that 0 ≤ x_(1), y_(1), x_(2), y_(2) ≤ 50, how many right triangles 
#can be formed?

square_range = 50
count = 3 * ( square_range * square_range )

epsilon = 0.0001

1.upto( square_range ) { | pointA_x1 |
  pointA_x1.upto( square_range ) { | pointA_y1 |
    x1 = pointA_x1.to_f
    y1 = pointA_y1.to_f
    pointA_on_bissectice = ( x1 == y1 )
    
    slope = -x1 / y1
    y_intercept = y1 + x1 * x1 / y1

    0.upto(square_range) { | x2 | 
      if ( x1 != x2 )
        y2 = slope * x2 + y_intercept
        y2_round = y2.round
        if ( ( 0 <= y2_round ) and ( y2_round <= square_range ) ) and ( ( y2_round - y2 ).abs < epsilon ) then 
          if ( pointA_on_bissectice ) then count += 1 else count += 2 end
        end
      end
    }
  }
}

print count, "\n"
