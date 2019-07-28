require_relative 'stepable.rb'
require_relative 'pieces.rb'

class Knight < Piece

    include Stepable

    def symbol
       :N
    end

end
