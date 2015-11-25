require('pry-byebug')
require_relative('game') 

game = Game.new

#place piece
game.place_piece(0,0)

#outside board range
# game.outside_board

#winning line
puts game.has_won?(:o)

#display the board
puts game.display_board




game.game_reset

##test display row
##puts "test row #{game.row_to_string([:o,nil,nil])}"


##To detect if someone has won and output answer
piece = :o
puts "Checking if game is won #{game.has_won?(piece)} expect to be false"
game.place_piece(1,0)
game.place_piece(1,1)
game.place_piece(1,2)
game.place_piece(0,1)
game.place_piece(0,2)



# binding.pry; ''


### TO DO - Don't allow pieces to be put outside of the board range
### TO DO - Rotate the starting piece when resetting
### TO DO - Automatically reset when the board is full and tell us it's a draw

### TO DO - Automatically detect when someone has won and notify
# and we need to check if vertical, horizontal and diagonal line 