# Here is the JSON structure to represent the state of account:

# {
#   client: "Mark Zuck",
#   balance_usd: 123.45,
#   show_deposits: true,
#   transactions: [
#     { description: "McDonalds",          type: :withdrawal, amount: 40 },
#     { description: "Selling ads",        type: :deposit,    amount: 1000 },
#     { description: "Selling user data",  type: :deposit,    amount: 300 },
#     { description: "Lawyer",             type: :withdrawal, amount: 200 },
#     { description: "Lunch with friends", type: :withdrawal, amount: 100 },
#   ]
# }

# Write a program that accepts hash above and prints the result to the screen. Make sure that the above switch works and the program doesn’t show any deposits if the switch is off.

# Please try yourself before looking at the solution.



def show(info)
  puts "Name: #{info[:client]}"
  puts "Balance: $#{info[:balance_usd]}"
  puts "Show deposits: #{info[:show_deposits]}"
  puts

  puts "Transactions:"

  info[:transactions].each do |t|
    next if !info[:show_deposits] && t[:type] == :deposit

    puts "#{t[:description]}, #{t[:type]}, $#{t[:amount]}"
  end
end

show({
  client: "Mark Zuck",
  balance_usd: 123.45,
  show_deposits: true, # Change to false to hide deposits
  transactions: [
    { description: "McDonalds",          type: :withdrawal, amount: 40 },
    { description: "Selling ads",        type: :deposit,    amount: 1000 },
    { description: "Selling user data",  type: :deposit,    amount: 300 },
    { description: "Lawyer",             type: :withdrawal, amount: 200 },
    { description: "Lunch with friends", type: :withdrawal, amount: 100 },
  ]
})