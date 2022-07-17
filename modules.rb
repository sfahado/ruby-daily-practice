# Sub-typing through inheritance

class Player
  attr_accessor :x, :y

  def initialize(options={})
    @x = options[:x] || 0
    @y = options[:y] || 0
  end

  def right
    self.x += 1
  end

  def left
    self.x -= 1
  end

  def up
    self.y += 1
  end

  def down
    self.y -= 1
  end

  def label
  end
end

class Robot < Player
  def label
    '*'
  end
end

class Dog < Player
  def up
  end

  def left
  end

  def label
    '@'
  end
end

class Human < Player
  def label
    'H'
  end
end