require 'byebug'
require_relative 'tile.rb'

class Board

  attr_reader :grid, :size

  def initialize(size = 9)
    debugger
    @size = size
    self.seed_bombs
    self.empty_grid
  end

  def empty_grid
    @grid = Array.new(@size) do
      Array.new(@size) {Tile.new(self)}
    end
  end

  def [](pos)
    pos = x,y
    grid[x][y]
  end

  def []=(pos, status)
    pos = x,y
    tile = grid[x][y]
    tile.status = status
  end

  def seed_bombs
    # bomb_pos.each do
  end

  def bomb_pos
    bomb_pos = []
    @size.times do
      bomb_pos << [(0..@size-1).to_a.sample,(0..@size-1).to_a.sample]
    end
    bomb_pos
  end

end

board = Board.new
tile = Tile.new(board)
