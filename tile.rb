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

  def neighbors_pos(pos) #returns array of positions of adjacecent tiles
    neighbors_pos = []
    x_options = coord_generator (pos[0])
    y_options = coord_generator (pos[1])
    x_options.each do |x|
      y_options.each do |y|
        neighbors << [x,y] if [x,y] != pos && tile_exists?([x,y])
      end
    end
    neighbors_pos
  end

  def neighbors(pos)
    neighbors = []
    neighbors_pos(pos).each do |neighbor_pos|
      neighbors << @board[*neighbor_pos]
    end
    neighbors
  end

  def tile_exists?(coord)
    return false if coord.any?{|x| x < 0 || x > @board.size}
    true
  end

  def coord_generator(coord)
    [coord - 1, coord, coord +1]
  end

  def neighbor_bomb_count(pos)
    neighbors(pos).count {|neighbor| neighbor.bomb}
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
