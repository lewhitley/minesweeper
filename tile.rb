class Tile

  def initialize(bomb = false)
    @revealed = false
    @bomb = bomb
  end

  def reveal
    @revealed ? puts "Tile already revealed " : @revealed == true
  end

  def neighbors(pos)

  end

  def neighbor_bomb_count(pos)

  end
  
end
