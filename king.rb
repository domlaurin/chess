require_relative 'stepable.rb'
require_relative 'pieces.rb'

class King < Piece

    include Stepable

    def symbol
       :K
    end

end
