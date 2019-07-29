require_relative 'player.rb'

class HumanPlayer < Player 
    
    def make_move
        move = nil
        until move != nil
            puts ""
            @display.render
            move = @display.cursor.get_input 
        end
        start_pos = move.dup
        
        a,b = start_pos
        
        until move != start_pos && move != nil
            puts ""
            print @display.board.board[a][b].valid_moves
            puts ""
            @display.render
            move = @display.cursor.get_input
        end
        end_pos = move.dup

        @display.board.move_piece(start_pos, end_pos)
    end
end


#display possible moves when a start_pos is selected.