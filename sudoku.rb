load 'read-sudoku.rb'

board = read_board()

def find_possible_values(board, row, col) 
  candidates = (1..N).to_a
  in_row = board[row].select{|x| x != 0 }
  in_col = (0...N).map{|r| board[r][col] }.select{|x| x != 0 }

  br = row / B
  bc = col / B
  in_block = (br*B...(br+1)*B).flat_map {|r|
    (bc*B...(bc+1)*B).map {|c| board[r][c] }
  }.select{|x| x != 0 }

  candidates -= in_row
  candidates -= in_col
  candidates -= in_block
  puts "candidates: #{candidates} = #{(1..N).to_a} - #{in_row} - #{in_col} - #{in_block}"
  candidates
end

def solved(board)
  board.all? { |row| 
    row.all? { |x| x != 0 }
  }
end

while !solved(board) do
  (0...N).each {|row|
    (0...N).each {|col|
      puts "Checking row: #{row}, col:#{col}"
      print_board(board)
      # If there is an empty cell
      if board[row][col] == 0
        possible_values = find_possible_values(board, row, col)

        # TODO: If there is two or more candidates?
        if possible_values.length == 1
          board[row][col] = possible_values.first
        end
      end
    }
  }
end

puts "Solved!!"
