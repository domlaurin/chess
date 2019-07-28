class Piece
    require 'byebug'

    attr_accessor :color, :board_class_instance, :board, :pos

    def initialize(color, board, pos) #the 'board' here is the Board class instance
        @color = color
        @board_class_instance = board
        @board = board.board
        @pos = pos
    end
    
    def empty?
        a,b = @pos
        @board[a][b] == nil
    end

    # def move_into_check?(end_pos)
    #     # new_board = @board_class_instance.dup
        
    #     # new_board.move_piece!(@pos, end_pos) #new_board is a 2d arr here
    #     # new_board.in_check?(@color)        
    # end

    def valid_moves 
        good_moves = []
        # #debugger

        possible_moves = self.moves
        possible_moves.each do |move|
            @board_class_instance.move_piece!(@pos, move)

            if @board_class_instance.in_check?(@color)
                @board_class_instance.undo(move, @pos)
                next
            end
            @board_class_instance.undo(move, @pos)
            good_moves << move
        end

        good_moves
    end
    
    def symbol
        "piece"
    end

    def inspect
        { 'symbol' => self.symbol, 'color' => @color, 'pos' => @pos }.inspect
    end

end