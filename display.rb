require "colorize"
require_relative 'cursor.rb'
require_relative 'board.rb'

require 'byebug'
class Display

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        @board.each_with_index do |row, i| 
            array = row.map.with_index do |piece, i2|
                if [i, i2] == @cursor.cursor_pos
                    "#{piece.symbol}".colorize(:red)
                else
                    piece.symbol
                end
            end
            puts array.join(" ")
        end
        # @cursor.get_input

        # puts ""
        
        # @board.each_with_index do |row, i| 
        #     array = row.map.with_index do |piece, i2|
        #         if [i, i2] == @cursor.cursor_pos
        #             "#{piece.symbol}".colorize(:red)
        #         else
        #             piece.symbol
        #         end
        #     end
        #     puts array.join(" ")
        # end
        nil
    end

end


