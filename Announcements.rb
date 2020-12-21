module Announcements

  def colorize(color, val)
    return "\e[#{color}m#{val}\e[0m"
  end

  def annouce_chose_size
    puts "\nWelcome to Chose-a-Size Tic Tac Toe!"
    puts "Type a digit between #{colorize(36,3)} and #{colorize(36,9)} for the board size." 
  end

  def chose_size_error
    puts "\nOops, looks like you didn't type a digit between 3 and 9 inclusive. Let's try again!"
  end

  def announce_player_chose_name(player_num)
    puts "\nPlayer #{player_num}, please type your name."
  end

  def announce_player_welcome(player_num, name)
    marker = (player_num == 1) ? "X" : "O"
    color = (player_num == 1) ? 36 : 31
        puts "\nWelcome #{colorize(color,name)}! You will be playing with the #{colorize(color, marker)} marker."
  end

  def announce_take_turn(player_num, name)
    color = (player_num == 1) ? 36 : 31
    puts "\nYour turn #{colorize(color,name)}!. Please type a number that's still on the board."
  end

  def announce_input_error
    puts "\nOops, looks like you didn't type an available number. Let's try again!"
  end

  def announce_winner(player_num, name)
    color = (player_num == 1) ? 36 : 31
    puts "\nCongrats #{colorize(color,name)} you won! Want to play again? Type 'y' for yes and 'n' for no."
  end

  def announce_cats_game
    puts "\nCats game! Want to play again? Type 'y' for yes and 'n' for no."
  end


end

