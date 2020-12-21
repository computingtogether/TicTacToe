
class Board

  attr_accessor :board_array, :board_size, :available_numbers

  def initialize(size)
    @board_array = []
    @board_size = size
    create_board_array!(board_size)
    fill_board_array!(board_size)
    @available_numbers = @board_array.map{|val| val}.flatten
    @available_numbers = @available_numbers.map{|val| val.to_i}
  end

  def create_board_array!(board_size)
    board_size.times do
      @board_array.push(Array.new(board_size))
    end
  end

  def fill_board_array!(board_size)
    num = 1
    for row in 0..board_size - 1 do
      for col in 0..board_size - 1 do
        @board_array[row][col] = num.to_s  
        num +=1
      end
    end
  end

  def display_board
    result_display = ""
    for row in 0..@board_size - 1 do
      for col in 0..@board_size - 1 do
        val = @board_array[row][col]
        result_display += spaces(val) + val + " " + vertical_segment(col) + 
                          horizontal_seperator(row, col)
      end
    end
    puts "\n" + result_display
  end

  def spaces(val) 
    val.length == 1 ? "  " : " "
  end

  def vertical_segment(col)
    col != (@board_size - 1) ? "|" : ""
  end

  def horizontal_seperator(row, col)
    horizontal_line = ""
    if (col == @board_size -1) && (row != @board_size - 1)
      horizontal_line += "\n"
      (@board_size * 5).times {horizontal_line +=  "-"}  
      horizontal_line += "\n" 
    end
    return horizontal_line
  end

  def add_marker(turn, input)
    marker = (turn == 1) ? "\e[#{36}m X\e[0m" : "\e[#{31}m O\e[0m"
    val = ""
    for row in 0..@board_size - 1 do
      for col in 0..@board_size - 1 do
        if input.to_s ==  @board_array[row][col] 
          @board_array[row][col] = marker
          available_numbers.delete(input)
        end
      end
    end
  end

  def horizontal_win
    for row in 0..@board_size - 1 do
      if @board_array[row].uniq.size <= 1
        return true
      end
    end
    return false
  end

  def vertical_win
    for col in 0..@board_size - 1 do
      vert_array = []
      for row in 0..@board_size - 1 do
        vert_array.push(@board_array[row][col])
      end
      if vert_array.uniq.size <= 1
        return true
      end
    end
    return false
  end

  def diagonal_win
    slant_down_array = []
    slant_up_array = []
    for row in 0..@board_size - 1 do
      for col in 0..@board_size - 1 do
        if row == col  
          slant_down_array.push(@board_array[row][col])
        end
        if row + col == @board_size-1
          slant_up_array.push(@board_array[row][col])
        end
      end
    end

    if slant_down_array.uniq.size <= 1 || slant_up_array.uniq.size <= 1 
      return true
    end 
      return false 
  end

end



