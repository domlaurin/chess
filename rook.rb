require_relative 'slideable.rb'
require_relative 'pieces.rb'

class Rook < Piece

    include Slideable

    def symbol
       :R 
    end

    def move_dirs
        LINEAR_DIRS
    end

end