# frozen_string_literal: true

class Node
  attr_accessor :next
  attr_reader   :value

  def initialize(value)
    @value = value
    @next  = nil
  end
end

def insert_at_head(head, data)
  newNode = Node.new(data)
  newNode.next = head
  newNode
end

def insert_at_tail(head, node)
  return node if head.next.nil?

  temp = head
  temp = temp.next while temp.next

  temp.next = node
  head
end

def create_random_list(length)
  list_head = nil
  (0..length - 1).each do |_i|
    list_head = insert_at_head(list_head, rand(1...100))
  end
  list_head
end

def create_linked_list(lst)
  list_head = nil
  lst.reverse.each do |x|
    list_head = insert_at_head(list_head, x)
  end
  list_head
end

def display(head)
  temp = head
  while temp
    print temp.value
    $stdout.flush
    temp = temp.next
    unless temp.nil?
      print ', '
      $stdout.flush
    end
  end
end

def to_list(head)
  lst = []
  temp = head
  while temp
    lst.push(temp.value)
    temp = temp.next
  end
  lst
end

def is_equal(list1, list2)
  return true if list1 === list2

  while !list1.nil? && !list2.nil?
    return false if list1.value != list2.value

    list1 = list1.next
    list2 = list2.next
  end
  list1 == list2
end
