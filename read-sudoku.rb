# Block size
B = 2
# Board height (width). When B=2, N=4
N = B * B 

def read_board()
  # Initialize NxN board
  board = Array.new(N).map{Array.new(N)}
  (0...N).each {|row|
    (0...N).each {|col|
      board[row][col] = 0
    }
  }

  # Read file and populate the board
  lines = IO.readlines("4x4.txt")
  lines.each_with_index {|line, row|
    line.chomp.split("").each_with_index {|x, col|
       num = if(x == ' ')
          0
       else 
          x.to_i
       end
       board[row][col] = num
    }
  }
  board
end

board = read_board()

# print board
def print_board(board)
  (0...N).each {|row|
    puts "=" * (2 * N + 1) if row % B == 0
    print "!"
    print board[row].each_slice(B).map { |block| 
      block.join(" ")
    }.join("!")
    print "!\n"
  }
  puts "=" * (2 * N + 1)
end

print_board(board)
