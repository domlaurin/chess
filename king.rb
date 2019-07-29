require_relative 'stepable.rb'
require_relative 'pieces.rb'

class King < Piece

    include Stepable

    def symbol
        if color == :w
            "\u2654".encode('utf-8')
        else
            "#{"\u265A".encode('utf-8')}"
        end 
    end

end


