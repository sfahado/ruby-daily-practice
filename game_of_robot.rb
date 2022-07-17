# Robot program

class Robot
  # Accessors, so we can access coordinates from the outside
  attr_accessor :x, :y

  # Constructor, accepts hash. If not specified, empty hash will be used.
  # In hash we expect two parameters: initial coordinates of the robot.
  # If not specified, will equal to zero by default.
  def initialize(options={})
    @x = options[:x] || 0
    @y = options[:y] || 0
    @num = options[:num] || 0
  end

  def right
    return if @num.even?

    self.x += 1
  end

  def left
    return if @num.even?

    self.x -= 1
  end

  def up
    return if @num.odd?

    self.y += 1
  end

  def down
    return if @num.odd?

    self.y -= 1
  end
end

# Commander is something that moves a robot.
class Commander
  
  # Issue a command to move a robot. Accepts robot object
  # and sends it a random command.
  def move(who)
    m = [:right, :left, :up, :down].sample
    who.send(m)
  end
end

# Create commander object, we'll have only one commander
# in this example.
commander = Commander.new

# Array of ten robots, each robot has its own number from 0 to 9.
arr = []
10.times do |num|
  arr << Robot.new(num: num)
end

# Infinite loop (hit ^C to stop the loop)
loop do
  # Tricky way to clear the screen
  puts "\e[H\e[2J"

  # Draw the grid. It starts with -30 to 30 by X,
  # and from 12 to -12 by Y
  (12).downto(-12) do |y|
    (-30).upto(30) do |x|
	  # Check if we have a robot with X and Y coordinates
      found = arr.any? { |robot| robot.x == x && robot.y == y }

      # Draw star if a robot was found. Dot otherwise.
      if found
        print '*'
      else
        print '.'
      end
    end

	# Move to the next line on the screen.
    puts
  end

  # Move each robot randomly.
  arr.each do |robot|
    commander.move(robot)
  end

  # Wait for half a second.
  sleep 0.5
end