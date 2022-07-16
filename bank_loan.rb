# You’re planning to buy a house for $500,000 and your employer credit union is offering a zero percent interest rate for 30 years. To pay off this house, you need to pay $16,666 every year. This is calculated when we divide $500,000 by 30. Write a program that will show the amount that is left to pay for each year.


price = 500_000

31.times do |n|
  puts "Year #{n}, left to pay: #{price - n * 16_666}"
end