# Full Robot game with dog

class Robot

# Accessors, so we can access coordinates from outside 
  attr_accessor :x, :y

# Constructor, accepts hash. If hash not specified, empty is used. 
# We expect two parameters in hash: initial robot coordinates;
# if not specified, both will equal to zero.
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
    # New method, just a symbol we use for robots.
  def label 
  '*'
  end 
end
# Dog class has the similar interface, some methods are empty below.
class Dog
# Accessors, so we can access coordinates from outside 
attr_accessor :x, :y
# Constructor, accepts hash. If hash not specified, empty is used. 
# We expect two parameters in hash: initial dog coordinates;
# if not specified, both will equal to zero.
  def initialize(options={})
    @x = options[:x] || 0
    @y = options[:y] || 0 
  end
  
  def right 
    self.x += 1
  end
  # Empty method, but it exists. When called does nothing. We need it 
  # to avoid "missing method" error.
  def left
  end
    # Another empty method.
  def up 
  end
  def down 
    self.y -= 1
  end
    # New method, just a symbol we use for robots.
  def label 
  '@'
  end 
end

# Comander class sends commands and moves robots and dogs.
# Note that THIS CLASS IS EXACTLY THE SAME AS IN PREVIOUS EXAMPLE. 
class Commander
  
  # Send command to move an object. Method accept object and sends 
  # it a random command.
  def move(who)
    m = [:right, :left, :up, :down].sample
    
    # Polymorphism is happening here! We're sending command,
    # but we're unaware of receiver!
    who.send(m) 
  end
end

# Create commander object. There is going to be only one commander.
commander = Commander.new # Array of 10 robots and...
arr = Array.new(10) { Robot.new }

# ...one dog. Since dog implements the same interface, all objects # in array will be kinda same.
arr.push(Dog.new(x: -12, y: 12))

# Infinite loop goes here (press ^C to stop)
loop do
  
  # Tricky way to clear the screen
  puts "\e[H\e[2J"
  
  # Draw the grid. It goes from -12 to 12 by X, and 12 to -12 by Y.
  (12).downto(-12) do |y| 
    (-12).upto(12) do |x|
        
      # Check if we have somebody with "x" and "y" coordinates.
      somebody = arr.find { |somebody| somebody.x == x && somebody.y == y}
        
      # Print label if somebody present. Print dot otherwise.
      if somebody
        # POLYMORPHISM GOES HERE.
        # We print "*" or "@", but we don't know what it is exactly, 
        # and we don't have to know.
        print somebody.label
      else
        print '.' 
      end
    end
    
    # Go to the next line.
    puts
  end

  # Hit check. If both objects have the same coordinates and their 
  # labels aren't equal, then we assume that a robot caught the dog. 
  game_over = arr.combination(2).any? do |a, b|
    a.x == b.x && \
    a.y == b.y && \
    a.label != b.label
  end

  if game_over
    puts 'Game over' 
    exit
  end

  # Move each object in random order.
  arr.each do |somebody|
    # Call move method. Code is the same as in previous example. 
    # Commander doesn't know about the object type. 
    commander.move(somebody)
  end
  # Sleep for half a second.
  sleep 0.5 
end