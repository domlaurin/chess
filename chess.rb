Phase 1

# 1. create Board that holds a 2 dimensional array. 
    a. each square on the board contains either a Piece or a NullPiece (NullPiece will inherit from Piece)
    # b. create an empty Piece class as a placeholder
    # c. write an initialize method so we can setup the board with instances of Piece, where pieces should be, and nil where NullPiece should be.
    # d. make a move_piece(start_pos, end_pos) method.
        # a. update the 2D grid and also the moved piece's' position
        # b. raise an exception if:
        #     a. there is no piece at start_pos or
            b. the piece cannot move to end_pos.

# 2. TEST DIS BOY

Phase 2 

1. Pieces
    a. create moves method.
        a. return all places a Piece can move to.
    b. create modules Slideable and Stepable.
        a. The Slideable module needs to know what direction a piece can move. Bishop, Rook, and Queen include Sliedeable module.
        b. Implement a move_dirs method to determine which moves will use.
    c. Piece will need to:
        a. track its position
        b. hold a refence to the Board.
    d. NullPiece class should include the singleton module.
        a. it should be able to read its color
        b. it should be able to read its symbol