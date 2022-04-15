# frozen_string_literal: true

require 'pry'

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next_node

  def initialize(val = 0, next_node = nil)
    @val = val
    @next_node = next_node
  end
end

# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
def merge_two_lists(list1, list2) # rubocop:disable Metrics/MethodLength
  curr = ListNode.new
  head = curr

  while list1 && list2
    if list1.val < list2.val
      curr.next_node = list1
      list1 = list1.next_node
    else
      curr.next_node = list2
      list2 = list2.next_node
    end
    curr = curr.next_node
  end

  curr.next_node = list1 || list2
  head.next_node
end

def insert_to_list(list_node, val)
  new_node = ListNode.new(val)
  return new_node unless list_node

  list_node.next_node = new_node
  list_node.next_node
end

def print_list_node(list_node)
  return unless list_node

  puts list_node.val
  print_list_node(list_node.next_node)
end

# list_array1 = [1, 3, 5]
# list_array2 = [2, 4]
node1 = ListNode.new(1)
node2 = ListNode.new(2)
node3 = ListNode.new(3)
node4 = ListNode.new(4)
node5 = ListNode.new(5)
node1.next_node = node3
node3.next_node = node5
node2.next_node = node4

linked_list1 = node1
linked_list2 = node2

puts 'Linked list 1'
print_list_node(linked_list1)

puts 'Linked list 2'
print_list_node(linked_list2)

merged_list = merge_two_lists(linked_list1, linked_list2)
puts 'Merged list'
print_list_node(merged_list)
