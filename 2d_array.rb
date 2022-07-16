# Traverse 2D array

arr = [
  %w(a b c),
  %w(d e f),
  %w(g h i)
]

0.upto(2) do |j| 
  0.upto(2) do |i|
    print arr[j][i] 
  end
end

# write a method to calculate the number of zeros in the array by passing a block to the count method.


def check_zeros(input_array)
  result = 0

    result = input_array.count do |result|
        result == 0
    end

return result
end

# write a method to calculate the number of even elements in the array.


def check_evens(input_array)
  result = 0
  ## Write Your Code Here
  result = input_array.count(&:even?)
  
return result
end


arr = [
  ['a', 'b', 'c'],
  ['d', 'e', 'f'],
  ['g', 'h', 'i']  
]


print arr[0][0]
print arr[1][1]
print arr[2][2]

print arr[0][2]
print arr[1][1]
print arr[2][0]





