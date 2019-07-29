require "singleton"
require_relative "pieces.rb"

class NullPiece < Piece

    attr_reader :color, :symbol
    def initialize
        @color = "no color"
        @symbol = "."
    end

    def inspect
        { 'symbol' => self.symbol }.inspect
    end
end




#singleton
