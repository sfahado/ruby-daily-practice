# Outline#
# Let’s outline our plan. Variable balance will represent the amount of money we have in the bank. We’ll have three slot reels and a few images. Traditionally, slot machines have images of fruits, a cherry, a bell, and the number 7. To simplify our task, we’ll use the numbers from 0 to 5 instead of the images mentioned above. We can always revisit our game and make changes to it.

# Variables x, y, and z will represent the reels. Each reel can hold only one value, from 0 to 5, at a time. A random number generator will define this value.

# Win or lose#
# The next step is to define what “win” and “lose” mean. When all three variables x, y, and z are equal, we’ll enforce the following rules:

# If all the numbers are zeroes, the player will lose everything.
# If all the numbers are ones, $10 will be added to the player’s balance.
# If all the numbers are twos, $20 will be added to the player’s balance.
# Otherwise, the player will be charged 50 cents for each attempt.
# The program should work until we have no money remaining in our balance.


print "What's your age: "
age = gets.to_i
if age < 18
  puts 'Sorry, but you should be at least 18 to play'
exit
end

balance = 20 
loop do
  puts 'Press Enter to pull the handle...'
  gets
  x = rand(0..5)
  y = rand(0..5)
  z = rand(0..5)
  puts "Result: #{x} #{y} #{z}"
  if x == 0 && y == 0 && z == 0
    balance = 0
    puts 'You lost your money'
  elsif x == 1 && y == 1 && z == 1
    balance += 10
    puts 'You won $10'
  elsif x == 2 && y == 2 && z == 2
    balance += 20
    puts 'You won $20'
  else
    balance -= 0.5
    puts 'You lost 50 cents'
  end
  puts "Your balance is #{balance} dollars"
end