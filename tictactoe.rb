class Board
    attr_reader :cells

    def initialize
        @cells = Array.new(9," ")
    end

    def draw_board
        puts " "
        (0..8).step(3) do |i|
            puts " #{@cells[i]} | #{@cells[i+1]} | #{@cells[i+2]} "
        end 
    end

    def board_instructions
        puts "Choose your position by typing from 1 to 9 as shown in figure"
        puts " 1 | 2 | 3 "
        puts " 4 | 5 | 6 "
        puts " 7 | 8 | 9 "
    end

    def cell_taken?(position)
        @cells[position] == "X" || @cells[position] == "O"
    end
end

class Player
    attr_accessor :name
    def initialize(name)
        @name = name
    end
end

class TicTacToe
    attr_accessor :player1, :player2

    def initialize
        welcome
        choose_symbol
        greetings
    end

    def welcome
        puts "Welcome to command line TicTacToe"
        puts "---------------------------------"
        puts "Enter Player 1's name"
        @player1 = Player.new(gets.chomp.capitalize)
        puts ""
        puts "Enter Player 2's name"
        @player2 = Player.new(gets.chomp.capitalize)
        puts ""
    end

    def choose_symbol
        
        loop do
            puts "#{@player1.name}, choose your symbol, X/O"
            @player1_symbol = gets.chomp.upcase
            break if @player1_symbol == "X" || @player1_symbol == "O"
        end

        if @player1_symbol == "X"
            @player2_symbol = "O"
        else
            @player2_symbol = "X"
        end
    end

    def greetings
        puts ""
        puts "#{@player1.name} has choosen :- #{@player1_symbol}"
        puts "#{@player2.name} gets :- #{@player2_symbol}"
        puts "--------------------------------------------"
        puts "Now let the game begins"
        puts ""
        puts "#{@player1.name}, Make the first choice"
    end

    def game_start
    end

    def play_again
        puts "Do you want to play the game again, Y/N"
        loop do
            input = gets.chomp.upcase
            return true if input == "Y"
            return false if input == "N"
            puts "Enter the correct choice"
        end
    end

    def game_loop
        game_start while play_again
    end
end

class game
end


TicTacToe.new
