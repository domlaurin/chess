require_relative 'stepable.rb'
require_relative 'pieces.rb'

class King < Piece

    include Stepable

    def symbol
        if color == :w
            "\u2654".encode('utf-8')
        else
            "#{"\u265F".force_encoding('utf-8')}"
        end 
    end

end


