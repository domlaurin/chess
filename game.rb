require_relative 'board.rb'
require_relative 'humanplayer.rb'

class Game

    def initialize
        @board = Board.new
        @display = Display.new(@board)
        @players = {:b => HumanPlayer.new(:b, @display), :w => HumanPlayer.new(:w, @display)}
        @current_player = @players[:w]
    end

    def play
        # debugger
        until @board.checkmate?(:w) || @board.checkmate?(:b)
            if @current_player.make_move == "a"
                next
            end
            self.swap_turn!
        end
        "#{@current_player} won with a checkmate!"
    end

    def notify_players
    end

    def swap_turn!
        if @current_player == @players[:w]
            @current_player = @players[:b]
        else
            @current_player = @players[:w]
        end
    end

end

=begin


checkmate
pressing on empty squares raises error
only allow the current player to move his own pieces

=end