require 'byebug'
module Slideable

  DIAGONAL_DIRS = [[1,1], [-1,1], [1,-1], [-1,-1]]
  LINEAR_DIRS = [[0,1],[1,0],[0,-1],[-1,0]]

  def moves

    moves = []
    
    self.move_dirs.each do |arr|
      clone_pos = self.pos.dup

      if (clone_pos[0] + arr[0]).between?(0,7) && (clone_pos[1] + arr[1]).between?(0,7)

        future_color = self.board[clone_pos[0] + arr[0]][clone_pos[1] + arr[1]].color
      end
      

      while clone_pos[0].between?(0,7) && clone_pos[1].between?(0,7) && future_color != nil && future_color != self.color

        if (clone_pos[0] + arr[0]).between?(0,7) == false || (clone_pos[1] + arr[1]).between?(0,7) == false
          break
        end
        future_color = self.board[clone_pos[0] + arr[0]][clone_pos[1] + arr[1]].color

        clone_future_color = future_color.dup
        x = clone_pos[0] += arr[0]
        y = clone_pos[1] += arr[1]
        good_move = [x, y].dup
        moves << good_move

        if clone_future_color != self.color && 
          clone_future_color != "no color"
          break
        end

      end

    end

    moves
  end

end
