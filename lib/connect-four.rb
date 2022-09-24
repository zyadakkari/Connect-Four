require 'pry-byebug'

class Game

  attr_accessor :board, :turn
  attr_reader :players, :choice

  def initialize()
    create_board()
    @players = Player.new
    @turn = 0

  end

  def create_board()
    @board = Array.new(6)
    @board.map! { |col| col = Array.new(7) }
  end

  def edit_board(input, square)
    @board[square[0]][square[1]] = input
  end

  def show_board()
    # p @board
    @board.each { |row|  p row}
  end

  def turn_decider()
    @turn += 1
    if @turn % 2 != 0
      @curPlayer = self.players.players[0]
    else
      @curPlayer = self.players.players[1]
    end

  end

  def select_column()
    puts "Pick a column between 0 - 6"
    while true do
      @choice = gets.to_i
      if @choice.between?(0, 6)
        return @choice
      else
        puts "Please enter a valid column"
      end
    end
  end

  def find_valid_square_in_column(choice=@choice)
# binding.pry
    @i = 5
    while !@board[@i][choice].nil? && @i >= 0
      @i -= 1
    end
    if @i >= 0
      return [@i, choice]
    else
      puts "Column full, please choose a different column"
      select_column()
    end
  end

  def play_turn()
    turn_decider()
    show_board()
    select_column()
    square = find_valid_square_in_column()
    edit_board(@curPlayer[:symbol], square)
    @curPlayer[:moves] << square
    show_board()
  end
end

class Player < Game
  attr_accessor :name, :moves
  attr_reader :symbol, :players

  def initialize()
    @players = []
    players << player_one()
    players << player_two()
  end

  def player_one(name="Player 1", symbol="X", moves=[])
    playerOne = {:name => name, :symbol => symbol, :moves => moves}
  end

  def player_two(name="Player 2", symbol="O", moves=[])
    playerTwo = {:name => name, :symbol => symbol, :moves => moves}
  end
end

newGame = Game.new
newGame.find_valid_square_in_column(0)