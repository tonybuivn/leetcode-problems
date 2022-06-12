# frozen_string_literal: true

require_relative './list_node'
require 'pry'

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers_old(l1, l2)
  temp = 0
  res = ListNode.new
  curr = res
  while l1 || l2 || temp == 1
    l1_val = l1&.val || 0
    l2_val = l2&.val || 0

    curr.val = l1_val + l2_val + temp
    temp = 0

    if curr.val > 9
      curr.val %= 10
      temp = 1
    end

    l1 = l1&.next || nil
    l2 = l2&.next || nil
    curr.next = ListNode.new if l1&.next || l2&.next || temp == 1
    curr = curr.next
  end

  res
end

def add_two_numbers(l1, l2)
  res = ListNode.new
  curr = res
  sum = 0
  while l1 || l2
    sum /= 10
    unless l1.nil?
      sum += l1.val
      l1 = l1.next
    end

    unless l2.nil?
      sum += l2.val
      l2 = l2.next
    end

    curr.next = ListNode.new(sum % 10)
    curr = curr.next
  end

  curr.next = ListNode.new(1) if sum / 10 == 1
  res.next
end

array1 = [8, 3, 2]
array2 = [9, 2, 1]
l1 = create_list_from_array(array1)
l2 = create_list_from_array(array2)

puts 'Linked list 1'
print_list_node(l1)
puts 'Linked list 2'
print_list_node(l2)

puts '====== Add two numbers'
print_list_node(add_two_numbers(l1, l2))
