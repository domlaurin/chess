class Piece
    require 'byebug'

    attr_accessor :color, :board_class_instance, :board, :pos

    def initialize(color, board, pos)
        @color = color
        @board_class_instance = board
        @board = board.board
        @pos = pos
    end

    def empty?
        a,b = @pos
        @board[a][b] == nil
    end

    def valid_moves 
        good_moves = []
        debugger

        possible_moves = self.moves
        possible_moves.each do |move|
            pos_clone = @pos.dup

            x,y = move

            will_kill_a_piece = false

            if self.board[x][y].symbol != "."
                killed_piece = self.board[x][y].dup
                will_kill_a_piece = true
            end

            @board_class_instance.move_piece!(@pos, move)
            
            if @board_class_instance.in_check?(@color)
                @board_class_instance.undo(move, pos_clone)
                if will_kill_a_piece == true
                    @board[x][y] = killed_piece
                end
                next
            end
            
            @board_class_instance.undo(move, pos_clone)
            if will_kill_a_piece == true
                @board[x][y] = killed_piece
            end
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

#Valid Moves