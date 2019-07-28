require_relative 'slideable.rb'
require_relative 'pieces.rb'

class Bishop < Piece

    include Slideable

    def symbol
       :B 
    end

    def move_dirs
      DIAGONAL_DIRS
    end

end