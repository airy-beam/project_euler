#Problem 96
#
#Su Doku (Japanese meaning number place) is the name given to 
#a popular puzzle concept. Its origin is unclear, but credit 
#must be attributed to Leonhard Euler who invented a similar, 
#and much more difficult, puzzle idea called Latin Squares. 
#The objective of Su Doku puzzles, however, is to replace 
#the blanks (or zeros) in a 9 by 9 grid in such that each 
#row, column, and 3 by 3 box contains each of the digits 1 to 9. 
#Below is an example of a typical starting puzzle grid and 
#its solution grid.
# <...>
#A well constructed Su Doku puzzle has a unique solution 
#and can be solved by logic, although it may be necessary to 
#employ "guess and test" methods in order to eliminate options 
#(there is much contested opinion over this). The complexity 
#of the search determines the difficulty of the puzzle; 
#the example above is considered easy because it can be solved
#by straight forward direct deduction.
#
#The 6K text file, sudoku.txt (right click and 'Save Link/Target As...'), 
#contains fifty different Su Doku puzzles ranging in difficulty, 
#but all with unique solutions (the first puzzle in the file 
#is the example above).
#
#By solving all fifty puzzles find the sum of the 3-digit 
#numbers found in the top left corner of each solution grid; 
#for example, 483 is the 3-digit number found in the top left 
#corner of the solution grid above.

class Array
  
  def delete_candidate_from_box(candidate, row, column)
    boxR = (row - 1) / 3 + 1
    boxC = (column - 1) / 3 + 1
    
    i_from = (boxR - 1) * 3 + 1
    i_to = boxR * 3
    j_from = (boxC - 1) * 3 + 1
    j_to = boxC * 3
    
    i_from.upto(i_to) { |i| 
      j_from.upto(j_to) { |j |
        if (self[i][j]) then self[i][j].delete(candidate) end 
      }
    }
  end
  
  def delete_candidate_from_row(candidate, row)
    1.upto(9) { |t| if (self[row][t]) then self[row][t].delete(candidate) end }
  end
  
  def delete_candidate_from_column(candidate, column)
    1.upto(9) { |t| if (self[t][column]) then self[t][column].delete(candidate) end }
  end
 
end

def try(step)   
  if ( step <= @@unknowns )
    min = 9
    minRow = 0
    minCol = 0
    1.upto(9) { |row_index|
      1.upto(9) { |col_index|
        if ( 0 == @@matrix[row_index][col_index] ) && ( @@candidates[row_index][col_index].size < min )
          min = @@candidates[row_index][col_index].size
          minRow = row_index
          minCol = col_index
        end
      }
    }

    try_candidate = 0
    while ( ( !@@success ) && ( try_candidate < @@candidates[minRow][minCol].size ) )
      @@matrix[minRow][minCol] = @@candidates[minRow][minCol][try_candidate]
      prev_candidates = Marshal.load(Marshal.dump(@@candidates))

      @@candidates.delete_candidate_from_row(@@matrix[minRow][minCol], minRow)
      @@candidates.delete_candidate_from_column(@@matrix[minRow][minCol], minCol)
      @@candidates.delete_candidate_from_box(@@matrix[minRow][minCol], minRow, minCol)
      try(step + 1)
      @@matrix[minRow][minCol] = 0
      @@candidates = Marshal.load(Marshal.dump(prev_candidates))
      try_candidate += 1      
    end    
  else
    @@success = true
    @@solution = Marshal.load(Marshal.dump(@@matrix))
  end
end
         
sum = 0
sudoku_file = File.new("input/sudoku.txt")
until sudoku_file.eof do
  @@matrix = []
  10.times { @@matrix.push( [] ) }
  
  sudoku_file.gets
  1.upto(9) { |i| 
    sudoku_line = sudoku_file.gets.split(//)
    sudoku_row = [ ]
    sudoku_row << 0
    sudoku_line.each { |number| sudoku_row << number.to_i }
    @@matrix[i] = sudoku_row
  }
          
  @@candidates = []
  10.times { @@candidates.push( [] ) }

  @@unknowns = 0
  1.upto(9) { |i|
    1.upto(9) { |j|
      if ( 0 == @@matrix[i][j] )
        @@candidates[i][j] = [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
        @@unknowns += 1
      end
    }
  }

  1.upto(9) { |i|
    1.upto(9) { |j|
      if ( 0 != @@matrix[i][j] )
        @@candidates.delete_candidate_from_row(@@matrix[i][j], i)
        @@candidates.delete_candidate_from_column(@@matrix[i][j], j)
        @@candidates.delete_candidate_from_box(@@matrix[i][j], i, j)
      end
    }
  }
  
  @@solution = [ ]
  @@prev_candidates = [ ]
  @@success = false
  try(1)
  digits = @@solution[1][1] * 100 + @@solution[1][2] * 10 + @@solution[1][3]
  sum += digits
  
#  1.upto(9) { |i|
#    1.upto(9) { |j|
#      print @@solution[i][j], " "
#    }
#    print "\n"
#  }
#  print "\n"
end

print sum, "\n"

