module DiagonalCheckable
  def right_up_diagonal(square, moves)
    if moves.include?([square[0]-1, square[1]+1]) && moves.include?([square[0]-2, square[1]+2]) && moves.include?([square[0]-3, square[1]+3])
      return @winner = true
    elsif moves.include?([square[0]+1, square[1]-1]) && moves.include?([square[0]-1, square[1]+1]) && moves.include?([square[0]-2, square[1]+2])
      return @winner = true
    elsif moves.include?([square[0]+2, square[1]-2]) && moves.include?([square[0]+1, square[1]-1]) && moves.include?([square[0]-1, square[1]+1])
      return @winner = true
    elsif moves.include?([square[0]+3, square[1]-3]) && moves.include?([square[0]+2, square[1]-2]) && moves.include?([square[0]+1, square[1]-1])
      return @winner = true
    end
  end

  def right_down_diagonal(square, moves)
    if moves.include?([square[0]+1, square[1]+1]) && moves.include?([square[0]+2, square[1]+2]) && moves.include?([square[0]+3, square[1]+3])
      return @winner = true
  elsif moves.include?([square[0]-1, square[1]-1]) && moves.include?([square[0]+1, square[1]+1]) && moves.include?([square[0]+2, square[1]+2])
      return @winner = true
  elsif moves.include?([square[0]-2, square[1]-2]) && moves.include?([square[0]-1, square[1]-1]) && moves.include?([square[0]+1, square[1]+1])
      return @winner = true
  elsif moves.include?([square[0]-3, square[1]-3]) && moves.include?([square[0]-2, square[1]-2]) && moves.include?([square[0]+1, square[1]+1])
      return @winner = true
    end
  end

  def left_up_diagonal(square, moves)
    if moves.include?([square[0]-1, square[1]-1]) && moves.include?([square[0]-2, square[1]-2]) && moves.include?([square[0]-3, square[1]-3])
      return @winner = true
  elsif moves.include?([square[0]+1, square[1]+1]) && moves.include?([square[0]-1, square[1]-1]) && moves.include?([square[0]-2, square[1]-2])
      return @winner = true
  elsif moves.include?([square[0]+2, square[1]+2]) && moves.include?([square[0]+1, square[1]+1]) && moves.include?([square[0]-1, square[1]-1])
      return @winner = true
  elsif moves.include?([square[0]+3, square[1]+3]) && moves.include?([square[0]+2, square[1]+2]) && moves.include?([square[0]-1, square[1]-1])
      return @winner = true
    end
  end

  def left_down_diagonal(square, moves)
    if moves.include?([square[0]+1, square[1]-1]) && moves.include?([square[0]+2, square[1]-2]) && moves.include?([square[0]+3, square[1]-3])
      return @winner = true
  elsif moves.include?([square[0]-1, square[1]+1]) && moves.include?([square[0]+1, square[1]-1]) && moves.include?([square[0]+2, square[1]-2])
      return @winner = true
  elsif moves.include?([square[0]-2, square[1]+2]) && moves.include?([square[0]-1, square[1]+1]) && moves.include?([square[0]+1, square[1]-1])
      return @winner = true
  elsif moves.include?([square[0]-3, square[1]+3]) && moves.include?([square[0]-2, square[1]+2]) && moves.include?([square[0]-1, square[1]+1])
      return @winner = true
    end
  end
end
