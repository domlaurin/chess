require_relative 'slideable.rb'
require_relative 'pieces.rb'

class Queen < Piece

    include Slideable

    def symbol
        if color == :w
            "\u2655".encode('utf-8')
        else
            "#{"\u265B".force_encoding('utf-8')}"
        end 
    end

    def move_dirs
        LINEAR_DIRS + DIAGONAL_DIRS
    end

end
