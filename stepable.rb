module Stepable 


    def move_diffs
        if self.is_a? Knight
            return [[2,1],[1,2],[-2,1],[-1,2],[2,-1],[1,-2],[-1,-2],[-2,-1]]
        elsif self.is_a? King
            return [[1,1],[-1,1],[1,-1],[-1,-1],[0,1],[1,0],[0,-1],[-1,0]]
        end
    end

    def moves

        new_array = []
        clone = self.pos.dup

        self.move_diffs.each do |arr|
            new_array << [clone[0] + arr[0], clone[1] + arr[1]]
        end

        new_array.select! {|arr| arr[0].between?(0,7) && arr[1].between?(0,7)} 

        new_array.select! {|arr| self.color != self.board[arr[0]][arr[1]].color}

        new_array
    end
end
