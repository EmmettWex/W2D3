require_relative "board"
require_relative "player"

class Battleship
    
    attr_reader :board, :player
    def initialize(n)
        @player = Player.new()
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        p @board.num_ships
        p @board.print
    end

    def lose?
        if @remaining_misses <= 0
            p 'you lose'
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships == 0
            p 'you win'
            return true
        else
            return false
        end
    end

    def game_over?
        if win? || lose?
            return true
        else
            return false
        end
    end

    def turn
        if !@board.attack(@player.get_move)
            @remaining_misses -= 1
        end

        p @board.print

        p @remaining_misses
    end 
end
