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
        until @board.checkmate?(:w) || @board.checkmate?(:b)
            @current_player.make_move
            self.swap_turn!
        end
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