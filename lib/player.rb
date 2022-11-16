class Player
    def get_move
        p 'enter a position with coordinates separated with a space like `4 7`'
        p_input = gets.chomp.split(" ")
        p_input.map { |ele| ele.to_i }
    end
end
