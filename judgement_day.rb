# Machines have taken over the world. There is a struggle for survival. Who will survive: humanity or machines? It’s up to destiny to decide our future. Well, actually, it’s up to the random number generator. The program will show the stream of upcoming events happening in the world. It would be much more interesting if we could show these events with some graphics, but the observer’s imagination will have to suffice for now.


# First, let’s agree that there are only 10,000 humans and 10,000 machines are left. With every iteration, we’ll have only one random event. The number of humans and machines will decrease with the same probability. Victory will be achieved when no more machines or humans are left. Now, let’s proceed with a solution.


########################################
# DEFINE VARIABLES
########################################
@humans = 10000
@machines = 10000


########################################
# AUXILIARY METHODS
########################################
# Method returns random value: true or false
def luck?
  rand(0..1) == 1
end

def boom
  diff = rand(1..5)

  if luck?
    @machines -= diff
    puts "#{diff} machines destroyed"
  else
    @humans -= diff
    puts "#{diff} humans killed"
  end
end

# Method returns random city name
def random_city 
  dice = rand(1..5) 
  if dice == 1
    'San Francisco'
  elsif dice == 2 
    'Moscow'
  elsif dice == 3 
    'Beijing'
  elsif dice == 4 
    'London'
  else
    'Seoul'
  end 
end

def random_sleep 
  sleep rand(0.3..1.5)
end

def stats
  puts "#{@humans} humans and #{@machines} machines left" 
end

########################################
# EVENTS
########################################
def event1
  puts "Missile launched against #{random_city}" 
  random_sleep
  boom
end

def event2
  puts "Nuclear weapon used against #{random_city}"
  random_sleep
  boom
end

def event3
  puts "Group of soldiers have breached defence in #{random_city}"
  random_sleep
  boom
end

########################################
# CHECKING VICTORY
########################################
def check_victory?
  false 
end

########################################
# MAIN LOOP
########################################
loop do
  if check_victory?
    exit
  end

  dice = rand(1..3)
  if dice == 1 
    event1
  elsif dice == 2 
    event2
  elsif dice == 3 
    event3
  end
  stats
  random_sleep
end

