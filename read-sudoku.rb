# Block size
B = 2
# Board height (width). When B=2, N=4
N = B * B 

# Initialize NxN board
board = Array.new(N).map{Array.new(N)}
(0...N).each {|row|
  (0...N).each {|col|
    board[row][col] = " "
  }
}

# Read file and populate the board
lines = IO.readlines("4x4.txt")
lines.each_with_index {|line, row|
  line.chomp.split("").each_with_index {|x, col|
     board[row][col] = x
  }
}

# print board
(0...N).each {|row|
  puts "-" * (2 * N + 1) if row % B == 0
  print "|"
  print board[row].each_slice(B).map { |block| 
    block.join(" ")
  }.join("|")
  print "|\n"
}
puts "-" * (2 * N + 1)
