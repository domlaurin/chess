require_relative 'slideable.rb'
require_relative 'pieces.rb'

class Bishop < Piece

    include Slideable

    def symbol
      if color == :w
        "\u2657".encode('utf-8')
      else
        "#{"\u265D".force_encoding('utf-8')}"
      end
    end

    def move_dirs
      DIAGONAL_DIRS
    end

end