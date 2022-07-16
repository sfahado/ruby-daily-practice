# Suppose that we’re writing a program to sell land on the Moon. Any piece of land that is less than 50 square meters costs $1,000. Land that is greater than 50 square meters, but less than 100 square meters will cost $1,500. And any land 100 square meters or above will cost $25 more for every square meter.

# With this scenario in mind, write a program that asks the width and length of the land that the user wants to buy, calculates the total area, and shows the price of the land.


puts "Width (for example, type 5 for 5 meters):"
width = gets.to_i
puts "Length (for example, type 20 for 20 meters):"
length = gets.to_i

# Write your code here
area = width * length
puts "Area is #{area} square meters"

price = 0
if area < 50
  price = 1000
elsif area >= 50 && area < 100
  price = 1500
else
  price = area * 25
end

puts "Price for the land is $#{price}"