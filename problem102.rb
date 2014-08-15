#Problem 102
#
#Three distinct points are plotted at random on a Cartesian plane, 
#for which -1000 ≤ x, y ≤ 1000, such that a triangle is formed.
#
#Consider the following two triangles:
#
#A(-340,495), B(-153,-910), C(835,-947)
#
#X(-175,41), Y(-421,-714), Z(574,-645)
#
#It can be verified that triangle ABC contains the origin, 
#whereas triangle XYZ does not.
#
#Using triangles.txt (right click and 'Save Link/Target As...'), a 27K text file 
#containing the co-ordinates of one thousand "random" triangles, find the number 
#of triangles for which the interior contains the origin.

def max(a, b)
  if a > b then a else b end
end

def min(a, b)
  if a < b then a else b end
end

count = 0
f_apices = File.new("input/triangles.txt")

until f_apices.eof do
  line = f_apices.gets
  apices_vector = line.split(",")
                  
  0.upto(5) { |i| apices_vector[i] = apices_vector[i].to_f }
  
  angle_contains_origin = true
  3.times do
    apex1 = [ apices_vector[0], apices_vector[1] ]
    apex2 = [ apices_vector[2], apices_vector[3] ]
    apex3 = [ apices_vector[4], apices_vector[5] ]
    
    x1, y1 = apex1[0], apex1[1]
    x2, y2 = apex2[0], apex2[1]
    x3, y3 = apex3[0], apex3[1]
  
    x = x1 * ( x2 * (y3 - y2) - y2 * (x3 - x2) ) / 
             ( x1 * (y3 - y2) - y1 * (x3 - x2) )

    if !( min(x2, x3) < x and x < max(x2, x3) )
      angle_contains_origin = false
    end
    
    2.times { apices_vector.push(apices_vector[0]).shift }
  end

  if (angle_contains_origin)
    count += 1
  end
  
end

print count
