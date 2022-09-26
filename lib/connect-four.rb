require 'pry-byebug'
require './lib/diagonal-win-check.rb'

class Game

  include DiagonalCheckable

  attr_accessor :board, :turn, :square
  attr_reader :players, :choice

  def initialize()
    create_board()
    @players = Player.new
    @turn = 0
    @winner = false

  end

  def create_board()
    @board = Array.new(6)
    @board.map! { |col| col = Array.new(7) }
  end

  def edit_board(input, square)
    @board[square[0]][square[1]] = input
  end

  def show_board()
    @board.each { |row|  p row}
  end

  def turn_decider()
    @turn += 1
    if @turn % 2 != 0
      @curPlayer = self.players.players[0]
    else
      @curPlayer = self.players.players[1]
    end
    puts "Your turn #{@curPlayer[:name]}"

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

  def horizontal_winner(playermoves=@curPlayer[:moves])
    playermoves = playermoves.sort
    movesHash = Hash[
      playermoves.group_by(&:first).collect do |key, values|
        [ key, values.collect { |v| v[1] }]
      end
    ]
    for key in movesHash.keys
        movesHash[key].each_cons(4) do |obj|
          if obj[1] == obj[0] + 1 && obj[2] == obj[1] + 1 && obj[3] == obj[2] + 1
            @winner = true
          end
        end
    end
    @winner
  end

  def vertical_winner(playermoves=@curPlayer[:moves])
    sortedmoves = playermoves.sort
    sortedmoves = sortedmoves.map { |arr| arr = [arr[1], arr[0]] }
    movesHash = Hash[
      sortedmoves.group_by(&:first).collect do |key, values|
        [ key, values.collect { |v| v[1] }]
      end
    ]
    for key in movesHash.keys
      movesHash[key].each_cons(4) do |obj|
        if (obj[1] == obj[0] + 1) && (obj[2] == obj[1] + 1) && (obj[3] == obj[2] + 1)
          @winner = true
        end
      end
    end
    @winner
  end

  def diagonal_winner(square, moves=@curPlayer[:moves])
    while @winner == false
      right_up_diagonal(square, moves)
      right_down_diagonal(square, moves)
      left_up_diagonal(square, moves)
      left_down_diagonal(square, moves)
      return @winner
    end
  end

  def play_turn()
    turn_decider()
    show_board()
    select_column()
    square = find_valid_square_in_column()
    edit_board(@curPlayer[:symbol], square)
    @curPlayer[:moves] << square
    horizontal_winner()
    vertical_winner()
    begin
      diagonal_winner(square)
    rescue
    end
  end

  def game()
    while @winner == false
      play_turn()
    end
    puts "the winner is #{@curPlayer[:name]}! Well done!"
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
newGame.game()
