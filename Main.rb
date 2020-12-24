require_relative 'game.rb'
require_relative 'board.rb'
require_relative 'announcements.rb'

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
