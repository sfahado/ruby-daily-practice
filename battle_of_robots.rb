# Let’s build a simple game together, to sum up, all information that we have gathered from the previous chapters. We’ll have 20 robots and two teams, with 10 robots in each team. Each team will be represented by its array, with a size of 10. Each element, or cell, of the array may have only one of these two values:

# 0 when the robot is destroyed.
# 1 when the robot is still alive.
# Define two arrays. 1 in the example below indicates that we defined an array with robots who are still alive

# arr1 = Array.new(10, 1)
# arr2 = Array.new(10, 1)
# Each team will attack one after the other. But what does it mean “to attack” in this case? If 1 in the array represents a robot that is alive, and 0 signifies a dead robot, then “to attack” means to "change the value for a certain cell in the array from 1 to 0.” But which cell are we going to attack? We have ten of them in each team. In this situation, we have two options:

# We can “attack” the cells one by one, sequentially. In other words, we can start by attacking cell 1 of array 1, then cell 1 of array 2, and so on. Whoever starts attacking first wins the game. This approach seems predictable and doesn’t sound too interesting.

# It’s much more fun to pick an index randomly. Randomness isn’t a guarantee that the index will remain unique while generating random numbers, so one team can attack the same cell of another team. For example, on a fifth turn, the second team will attack the third cell, but it’s possible that this cell was attacked before. So, the team won’t reach its goal in this turn of destroying the enemy, because the cell will already be equal to 0, and the number of destroyed enemies will remain the same. With this approach, the result of the battle is always determined by luck.

###############################
# DEFINE ARRAYS
###############################

# array for the first team
@arr1 = Array.new(10, 1)
# array for the second team 
@arr2 = Array.new(10, 1)

###############################
# ATTACK
###############################
# Method accepts array for attack

def attack(arr)
  sleep 1 # Add sleep here, so our program won't run too fast 
  i = rand(0..9)
  if arr[i] == 1
    arr[i] = 0
    puts "Robot at index #{i} has been destroyed"
  else
    puts "Missed at index #{i}"
  end
  
  sleep 1 # one more sleep to beautify the output
end

###############################
# VICTORY CHECK
###############################

def victory?

  robots_left1 = @arr1.count { |x| x == 1 }
  robots_left2 = @arr2.count { |x| x == 1 }
  
  if robots_left1 == 0
    puts "Team 2 wins, #{robots_left2} robots left"
    return true
  end

  if robots_left2 == 0
    puts "Team 1 wins #{robots_left1} robots left"
    return false
  end

  false 

end


###############################
# STATS
###############################

def stats
# number of alive robots for the first and second team

  cnt1 = @arr1.count { |x| x == 1 }
  cnt2 = @arr2.count { |x| x == 1 }

  puts "1st team has #{cnt1} robots left"
  puts "2nd team has #{cnt2} robots left"

end

loop do
  puts "First team is going to attack..."
  attack(@arr2)
  exit if victory?
  stats
  sleep 3
  puts "  "# empty line
  
  puts "Second team is going to attack..."
  attack(@arr1)
  exit if victory?
  stats
  sleep 3
  puts "  "# empty line
end