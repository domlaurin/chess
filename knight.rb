require_relative 'stepable.rb'
require_relative 'pieces.rb'

class Knight < Piece

    include Stepable

    def symbol
        if color == :w
            "\u2658".force_encoding('utf-8')
        else
            "#{"\u265E".force_encoding('utf-8')}"
        end 
    end

end
