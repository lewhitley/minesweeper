class Board
  def initialize(size = 9)
    @size = size
    @grid = Array.new(size) do
      Array.new(size) {Tile.new(!!!!)}
    end
    self.seed_bombs
  end

  def seed_bombs
    bomb_pos.each do
  end

  def bomb_pos
    bomb_pos = []
    @size.times do
      bomb_pos << [(0..@size-1).to_a.sample,(0..@size-1).to_a.sample]
    end
    bomb_pos
  end

end
