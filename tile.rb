class Tile

  def initialize(board, bomb = false)
    @revealed = false
    @bomb = bomb
    @status = :unexplored
    @board = board
  end

  def reveal
    @revealed ? puts "Tile already revealed " : @revealed == true
  end

  def neighbors(pos)

  end

  def neighbor_bomb_count(pos)

  end

  def change_status(pos, choice)
    if choice == "f"
      @status = :flagged
    elsif choice == "r"
      @status = :interior if neighbor_bomb_count(pos)== 0
      @status = :fringe if neighbor_bomb_count(pos) > 0
      reveal
    else
      puts "Not a valid move" unless valid_move?
    end
  end

  def valid_move?(choice)
    if choice != "r" || choice != "f"
      false
    else @revealed
      false
    end
    true
  end

  def is_bomb?
    @bomb
  end
end
