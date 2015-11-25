class Game

  def initialize
    @board = [ [nil,nil,nil],[nil,nil,nil],[nil,nil,nil] ]
    @pieces = [:o, :x]
    @turn = 0
  end


  def display_board
    row_strings = @board.map do |row|
      row_to_string(row)
    end
    row_strings.join("\n_ _ _\n")
  end

  def has_won?(symbol)
    horizontal_line?(symbol, @board)
    vertical_line?(symbol) ||
    diagonal_line?(symbol)
  end

  def row_has_winning_line(row, symbol)
    row.all? do |square| 
      square == symbol
    end
  end

  def horizontal_line?(symbol, board)
    board.any? do |row|
      row_has_winning_line(row, symbol)
    end
  end

  def vertical_line?(symbol)
    transpose_board = @board.transpose
    horizontal_line?(symbol, transpose_board)
  end

  def diagonal_line?(symbol)
    middle_piece = @board[1][1]
    return false if middle_piece != symbol
    top_left_and_bottom_right = @board[0][0]==symbol && @board[2][2]==symbol
    top_right_and_bottom_left = @board[0][2]==symbol && @board[2][0]==symbol
    top_left_and_bottom_right || top_right_and_bottom_left
  end

  def place_piece(row, column)
    ##everything is true apart from the false and nil object
    if row >= 3 
      puts "That move is not possible" 
    end

    if column >= 3
      puts "That move is not possible"
    end

    if @board[ row ][ column ] 
      puts "Already a piece there"
      return false
    end

    @board[ row ][ column ] = @pieces[ @turn % 2]
    @turn = @turn + 1
    puts "That move is not possible"
    return false
  end



# def reset
#   @board = [ [nil,nil,nil],[nil,nil,nil],[nil,nil,nil] ]
#   @turn = 0
#   ##next game the turn should be 1 and then 0, etc, etc
#   if @turn == 0 then @turn = 1
#   end
# end

def game_reset
  @board = [ [nil,nil,nil],[nil,nil,nil],[nil,nil,nil] ]
  @turn = 0
    ##next game the turn should be 1 and then 0, and so on......
    @pieces.rotate!
end

private
  ##Private method
  def row_to_string(row)
    row_symbols = row.map do |piece|
      piece || " "
    end
    row_symbols.join("|")
  end
end
