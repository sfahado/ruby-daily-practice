# frozen_string_literal: true

require '../netflix/linkedlist'

# helper function
def merge2_country(l1, l2)
  dummy = Node.new(-1)

  prev = dummy
  while l1 && l2
    if l1.value <= l2.value
      prev.next = l1
      l1 = l1.next
    else
      prev.next = l2
      l2 = l2.next
    end
    prev = prev.next
  end

  prev.next = if !l1.nil?
                l1
              else
                l2
              end

  dummy.next
end

# Main function
def mergeK_county(lists)
  if lists.length.positive?
    res = lists[0]
    (1..lists.length - 1).each do |i|
      res = merge2_country(res, lists[i])
    end
    return res
  end
  nil
end

# Driver code
a = create_linked_list([11, 41, 51])
b = create_linked_list([21, 23, 42])
c = create_linked_list([25, 56, 66, 72])

puts "All movie ID's from best to worse are:"
display(mergeK_county([a, b, c]))
