#Problem 28
#
#Starting with the number 1 and moving to the right in a 
#clockwise direction a 5 by 5 spiral is formed as follows:
#
#21 22 23 24 25
#20  7  8  9 10
#19  6  1  2 11
#18  5  4  3 12
#17 16 15 14 13
#
#It can be verified that the sum of both diagonals is 101.
#
#What is the sum of both diagonals in a 1001 by 1001 spiral
#formed in the same way?

def new_position(x, y, direction)
  case direction
  when :right
    return [x + 1,_y = y]
  when :down
    return [x, y + 1]
  when :left
    return [x - 1, y]
  when :up
    return [x, y - 1]
  end
end

SIZE = 1001
center_x = SIZE / 2
center_y = SIZE / 2

spiral = Array.new(SIZE)
0.upto(SIZE - 1) { |i| spiral[i] = Array.new(SIZE) }

round = 0
direction = :right
n = 1
x = SIZE / 2
y = SIZE / 2

until n > SIZE * SIZE do
  spiral[x][y] = n
  n += 1
  new_x, new_y = new_position(x,y, direction)
  if (new_x - center_x).abs > round || (new_y - center_y).abs > round then
    if direction == :right then
      direction = :down
      round += 1
      x = new_x
      y = new_y
    else
      case direction
      when :down 
        direction = :left 
      when :left 
        direction = :up 
      when :up 
        direction = :right 
      end
      x, y = new_position(x,y, direction)
    end
  else
    x = new_x
    y = new_y
  end
end

sum = 0
0.upto(SIZE - 1) { |i|
  sum += spiral[i][i]
  sum += spiral[i][SIZE - i - 1] unless i == SIZE / 2
}
print sum