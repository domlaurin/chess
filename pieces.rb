class Piece

    attr_accessor :color, :board, :pos

    def initialize(color, board, pos)
        @color = color
        @board_class = board
        @board = board.board
        @pos = pos
    end
    
    def empty?
        a,b = @pos
        @board[a][b] == nil
    end

    def move_into_check?(end_pos)
        new_board = @board_class.dup #we put dup on @board, not Board class
        
        new_board.move_piece!(@pos, end_pos) #not duping correctly
        new_board.in_check?(@color)        
    end

    def valid_moves 
        #when I write valid moves then do moves in pry - 
        #gives different errors, must be changing smth
        # debugger
      possible_moves = self.moves
      possible_moves.reject { |move| move_into_check?(move) }  
    end
    
    def symbol
        "piece"
    end

    def inspect
        { 'symbol' => self.symbol, 'color' => @color, 'pos' => @pos }.inspect
    end

end