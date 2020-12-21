require_relative 'Game.rb'
require_relative 'Board.rb'
require_relative 'Announcements.rb'

include Announcements



def run_game
  game = Game.new
  until game.winner do
    game.take_turn
  end
    # announce_winner()
    input = gets.chomp
    if input == "y"
      run_game
    end
end

run_game
