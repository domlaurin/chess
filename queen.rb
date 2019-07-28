require_relative 'slideable.rb'
require_relative 'pieces.rb'

class Queen < Piece

    include Slideable

    def symbol
       :Q 
    end

    def move_dirs
        LINEAR_DIRS + DIAGONAL_DIRS
    end

end
