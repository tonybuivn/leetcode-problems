# frozen_string_literal: true

require_relative './list_node'

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} node
# @return {Void} Do not return anything, modify node in-place instead.
def delete_node(curr)
  loop do
    curr.val = curr.next.val
    break if curr.next.next == nil

    curr = curr.next
  end

  curr.next = nil
end

def delete_node_solution_leetcode(node)
  node.val = node.next.val
  node.next = node.next.next
  nil
end

node1 = ListNode.new(4)
node2 = ListNode.new(5)
node3 = ListNode.new(1)
node4 = ListNode.new(9)
node5 = ListNode.new(7)
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

print_list_node(node1)

delete_node_solution_leetcode(node2)
puts '======= After deleting'
print_list_node(node1)
