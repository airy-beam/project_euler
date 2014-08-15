#Problem 67
#
#By starting at the top of the triangle below and moving to 
#adjacent numbers on the row below, the maximum total from top
#to bottom is 23.
#
#   3
#  7 5
# 2 4 6
#8 5 9 3
#
#That is, 3 + 7 + 4 + 9 = 23.
#
#Find the maximum total from top to bottom in triangle.txt,
#a 15K text file containing a triangle with one-hundred rows.

triangle = []
triangle_file = File.new("input/triangle.txt")
until triangle_file.eof do
  string = triangle_file.gets.split(/[ ]+/)
  row = []
  string.each { |number| row << number.to_i }
  triangle << row
end

1.upto(triangle.size - 1) do |i|
  triangle[i][0] += triangle[i-1][0]
  triangle[i][-1] += triangle[i-1][-1]
  1.upto(triangle[i].size - 2) do |j|
    if triangle[i - 1][j - 1] > triangle[i - 1][j] then
      triangle[i][j] += triangle[i - 1][j - 1]
    else
      triangle[i][j] += triangle[i - 1][j]
    end
  end
end

print triangle[triangle.size - 1].max
