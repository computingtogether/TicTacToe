require_relative 'board.rb'
require_relative 'announcements.rb'

class Game
  include Announcements

  attr_accessor :board, :turn, :winner, :player1_name, :player2_name

  def initialize
    @turn = 1
    @player1_name = ""
    @player2_name = ""
    @size
    intro_set_up
    @board 
    @winner = false
  end
  
  def intro_set_up
    annouce_chose_size
    @size = ask_size 
    @board = Board.new(@size)
    @board.display_board

    announce_player_chose_name(1)
    @player1_name = gets.chomp
    announce_player_welcome(1,player1_name)

    announce_player_chose_name(2)
    @player2_name = gets.chomp
    announce_player_welcome(2, player2_name)
  end

  def ask_size
    input = gets.chomp
    if input.match?(/^[3-9]$/) 
      return input.to_i 
    else
      chose_size_error
      ask_size
    end
  end

  def take_turn
    @board.display_board
    if check_for_cats_game then return end
    name = (@turn == 1) ? @player1_name : @player2_name
    announce_take_turn(@turn, name)
    take_num_input
    check_for_winner(name)
    @turn == 1 ? @turn = 2 : @turn = 1
  end

  def check_for_winner(name)
    if @board.horizontal_win || @board.vertical_win || @board.diagonal_win
        @board.display_board
        announce_winner(@turn, name)
        @winner = true
    end
  end

  def check_for_cats_game
    if @board.available_numbers.size == 0
      announce_cats_game
      @winner = true
      return true
    end
  end

  def take_num_input
    input = gets.chomp
    input = input.to_i if input.match?(/^\d{1,2}(?!\d)/)
    if @board.available_numbers.include?(input)
       @board.add_marker(@turn, input) 
    else
       announce_input_error
       take_num_input
    end
    
  end
end
