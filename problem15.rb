#Problem 15
#
#Starting in the top left corner of a 22 grid, 
#there are 6 routes (without backtracking) to the bottom right corner.
#
#How many routes are there through a 2020 grid?

SIZE = 20
matrix = []
(SIZE + 1).times { matrix << Array.new }
0.upto(SIZE) do |i|
  0.upto(SIZE) do |j|
    if 0 == i || 0 == j then
      matrix[i][j] = 1
    else
      matrix[i][j] = matrix[i - 1][j] + matrix[i][j - 1]
    end
  end
end
print matrix[SIZE][SIZE]
