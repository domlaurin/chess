require_relative 'slideable.rb'
require_relative 'pieces.rb'

class Rook < Piece

    include Slideable

    def symbol
        if color == :w
            "\u2656".encode('utf-8')
        else
            "#{"\u265C".force_encoding('utf-8')}"
        end 
    end

    def move_dirs
        LINEAR_DIRS
    end

end