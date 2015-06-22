#Chess
The code within contains logic for each individual chess piece as well as the gameplay logic for the game of chess. Player code allows for human players to be instantiated or computer players with basic AI.

After downloading repo running the following code in the console will set up a game between a human player and computer:
```
ruby chess_game
```
The "scripts/play_saved_game.rb" file will load the autosaved game file that is updated after every turn. 
##ChessGame
The ChessGame class is instantiated with a board, white player and black player. The run method is a simple loop that gets player input, calls move on the board, and checks to see if the game is over. Run will break out of the loop in the even of checkmate or a draw.

ChessGame#load allows a player to load a saved game state. ChessGame#default loads a board with pieces in the starting positions.
##Board
The board class keeps track of each square in a two dimensional array. Squares may be nil if empty, or contain a piece object. The board has methods to duplicate itself, check for checkmate, make a move, and create a render string.
##Player
A player has a color which determines their pieces. The human player and computer player classes have a play_turn method that accepts a board object and returns the chosen move in a specific formate [from_pos, to_pos]. The ChessGame run loop will verify that the move is legal and make the move or ask for a different move.
##Piece
The piece class is the parent class for all pieces. It defines basic methods shared by all pieces for checking if squares may be moved to, verifying the color of the piece and if another piece is an opponent or not.

Move is redefined on in subclasses usually by using a delta, and looping the delta over the piece's current position to find available moves. Those moves are then checked for validity.

Because a player may not move in such a way that puts the player's own king into check, the Piece#valid_moves method calls Piece#move_into_check?(pos) which creates a duplicate board, makes the move in question, and calls .in_check? on that duped board.
###Pawn
The pawn is a complicated piece because it moves in a different way than it captures. Also, the first time a pawn moves it may move 2 squares instead of the usual one. The moves method for pawn returns the results of two separate methods, one that finds all regular moves, and one that finds all capture moves. These methods use different move deltas since the pawn captures diagonally, but moves orthagonally.
###Sliding Piece
A sliding piece can move as many squares as possible in a single direction until it is stopped by a piece of its own color or it captures a piece of the opposite color. The moves method simply constructs an array of all the available moves by systematically adjusting the available square by the move delta until the piece hits a block is off the board, then repeating with the next move delta.
####Bishop
Bishop has access to the diagonal move deltas.
####Rook
Rook has access to the orthangonal move deltas.
####Queen
Queen has access to both the diagonal and orthagonal move deltas.  
###Stepping Piece
A stepping piece has a very specific set of move deltas that it can 'teleport' or 'jump' to. The available moves are simple every valid move produced by looping over the move deltas.
####Knight
The knight moves in the classic 'L' shape.
####King
The king can move in a single square in any direction.
