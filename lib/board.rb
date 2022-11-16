class Board

    attr_reader :size

    def initialize (n)
        @grid = Array.new(n, :N) { Array.new(n, :N) }
        @size = @grid.length ** 2
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, value)
        @grid[pos[0]][pos[1]] = value
    end

    def num_ships
        count = 0
        @grid.flatten.each { |ele| count += 1 if ele == :S }
        count
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            p 'you sunk my battleship!'
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        max_ships = 0.25 * @grid.flatten.length

        while num_ships < max_ships
            row = rand(0..@grid.length-1)
            column = rand(0..@grid.length-1)
            self[[row,column]] = :S if self[[row,column]] == :N
        end
    end

    def hidden_ships_grid

        hidden_grid = @grid.map.with_index do |arr, i|
            arr.map.with_index do |ele, j|
                if ele == :S
                    :N
                else
                    ele
                end
            end
        end
    end

    def self.print_grid(grid)
        grid.each.with_index do |arr, i|
            puts arr.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end
