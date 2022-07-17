str = 'the quick brown fox jumps over the lazy dog'
arr = str.split(' ')

hh = Hash.new(0)
arr.each do|word|
  hh[word] += 1
end

puts hh.inspect


#Import namespace below,because "set" is not imported by default. 

require'set'

#The main that accepts a string(sentence).
def f(str)

  # Create set instance
  set = Set.new

  # Iterate over each character in a string
  str.each_char do |c|
    # Only if character is greater than "a" and less than "z" (ignore other characters)
    if c >= 'a' && c <= 'z'
      # Add to set
      set.add(c) 
    end
  end

  # result is true when all letters of English alphabet are present
  set.size == 26
end

#prints true,because we use all letters of English alphabet in the following sentence
puts f('quick brown fox jumps over the lazy dog')


# Using dig to print nested data structure

users = [
    {
        first: 'John',
        last: 'Smith',
        address: {
            city: 'San Francisco',
            country: 'US',
            street: {
                line1: '555 Market Street',
                line2: 'apt 123'
            }
        }
    },
    { first: 'Pat', last: 'Roberts', address: { country: 'US' } },
    { first: 'Sam', last: 'Schwartzman' }
]

users.each do |user|
  puts user.dig(:address, :street, :line1)
end