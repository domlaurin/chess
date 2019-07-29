require_relative 'pieces.rb'
require 'byebug'
class Pawn < Piece

    def symbol
        if color == :w
            "\u2659".encode('utf-8')
        else
            "#{"\u265F".force_encoding('utf-8')}"
        end 
    end

    def moves
        new_arr = []
        new_arr.concat(self.forward_steps) if self.forward_steps != nil
        new_arr.concat(self.side_attacks) if self.side_attacks != nil

        new_arr
    end

    # private 

    def at_start_row?
        if self.color == :w
            return true if self.pos[0] == 1
        end
        if self.color == :b
            return true if self.pos[0] == 6
        end
    end

    def forward_dir
        return 1 if self.color == :w
        return -1 if self.color == :b
    end

    def forward_steps
        new_arr = []        

        if self.color == :w && self.at_start_row? == true
            if self.board[self.pos[0] + 1][self.pos[1]].color == "no color"
                new_arr << [self.pos[0] + 1, self.pos[1]]
            end
            if self.board[self.pos[0] + 2][self.pos[1]].color == "no color" && self.board[self.pos[0] + 1][self.pos[1]].color == "no color"
                new_arr << [self.pos[0] + 2, self.pos[1]]
            end
        elsif self.color == :w && self.at_start_row? == false
            if self.board[self.pos[0] + 1][self.pos[1]].color == "no color"
                new_arr << [self.pos[0] + 1, self.pos[1]]
            end
        end

        if self.color == :b && self.at_start_row? == true
            if self.board[self.pos[0] - 1][self.pos[1]].color == "no color"
                new_arr << [self.pos[0] - 1, self.pos[1]]
            end
            if self.board[self.pos[0] - 2][self.pos[1]].color == "no color" && self.board[self.pos[0] - 1][self.pos[1]].color == "no color"
                new_arr << [self.pos[0] - 2, self.pos[1]]
            end
        elsif self.color == :b && self.at_start_row? == false
            if self.board[self.pos[0] - 1][self.pos[1]].color == "no color"
                new_arr << [self.pos[0] - 1, self.pos[1]]
            end
        end

        new_arr
    end

    def side_attacks
        new_array = []

        if self.color == :w
            if self.board[self.pos[0] + 1][self.pos[1] + 1] != nil && self.board[self.pos[0] + 1][self.pos[1] + 1].color == :b
                new_array << self.board[self.pos[0] + 1][self.pos[1] + 1].pos
            end
            if self.board[self.pos[0] + 1][self.pos[1] - 1].color != nil && self.board[self.pos[0] + 1][self.pos[1] - 1].color == :b
                new_array << self.board[self.pos[0] + 1][self.pos[1] - 1].pos
            end
        elsif self.color == :b
            if self.board[self.pos[0] - 1][self.pos[1] + 1] != nil && self.board[self.pos[0] - 1][self.pos[1] + 1].color == :w
                new_array << self.board[self.pos[0] - 1][self.pos[1] + 1].pos
            end
            if self.board[self.pos[0] - 1][self.pos[1] - 1] != nil && self.board[self.pos[0] - 1][self.pos[1] - 1].color == :w 
                new_array << self.board[self.pos[0] - 1][self.pos[1] - 1].pos
            end
        end

        new_array
    end

end


# automatically deletes all pieces at the places that the opposite color piece can go to
# prob undo method that doesn't' recreate a piece after the piece takes it
# doesn't' let do 2nd move with pawn