#Problem 81
#
#In the 5 by 5 matrix below, the minimal path sum from the top left to 
#the bottom right, by only moving to the right and down, is indicated 
#in red and is equal to 2427.
#
#131	673	234	103	18
#201	96	342	965	150
#630	803	746	422	111
#537	699	497	121	956
#805	732	524	37	331
#
#Find the minimal path sum, in matrix.txt, a 31K text file 
#containing a 80 by 80 matrix, from the top left to the bottom right 
#by only moving right and down.

matrix = []
matrix_file = File.new("input/matrix.txt")
until matrix_file.eof do
  string = matrix_file.gets.split(/[,]+/)
  row = []
  string.each { |number| row << number.to_i }
  matrix << row
end

matrix_size = matrix.size
0.upto(matrix_size - 1) do |i|
  0.upto(matrix_size - 1) do |j|
    if 0 == i then
      matrix[i][j] += matrix[i][j-1] unless j == 0
    else
      if j == 0 then
        matrix[i][j] += matrix[i-1][j]
      else
        if matrix[i][j-1] < matrix[i-1][j] then
          matrix[i][j] += matrix[i][j-1] 
        else
          matrix[i][j] += matrix[i-1][j]
        end
      end
    end
  end
end

print matrix[matrix_size - 1][matrix_size - 1]
