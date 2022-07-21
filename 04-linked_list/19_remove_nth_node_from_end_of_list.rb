# frozen_string_literal: true

require_relative './list_node'
require 'pry'

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  curr = head
  counter = 0
  while curr != nil
    curr = curr.next
    counter += 1
  end

  if n == counter
    head = head.next
    return head
  end

  curr = head
  index = 1
  while curr != nil
    if index == counter - n
      curr.next = curr.next.next
      break
    end
    index += 1
    curr = curr.next
  end

  head
end

# Input: head = [1,2,3,4,5], n = 2
# Output: [1,2,3,5]
node1 = ListNode.new(1)
node2 = ListNode.new(2)
node3 = ListNode.new(3)
node4 = ListNode.new(4)
node5 = ListNode.new(5)
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

node_x = ListNode.new(1)

print_list_node(remove_nth_from_end(node_x, 1))
# TODO: https://leetcode.com/problems/remove-nth-node-from-end-of-list/discuss/8804/Simple-Java-solution-in-one-pass
