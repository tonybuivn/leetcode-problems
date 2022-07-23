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
# @return {ListNode}
def swap_pairs(head)
  return if head.nil?

  curr = head
  while curr.next != nil
    if curr == head
      head = swap(curr)
      curr = head.next
    else
      curr.next = swap(curr.next)
      curr = curr.next.next
    end

    break if curr.nil?
  end
  head
end

def swap(curr)
  return curr if curr.next.nil?

  sub_head = curr.next
  temp = curr.next.next
  curr.next.next = curr
  curr.next = temp
  sub_head
end

def swap_pairs_v2(head)
  pre = dummy = ListNode.new 0
  pre.next = head
  while curr = pre.next and next_n = curr.next
    c = next_n.next
    ((pre.next = next_n).next = curr).next = c
    pre = curr
  end
  dummy.next
end

# Input: head = [1,2,3,4]
# Output: [2,1,4,3]

# Input: head = [1]
# Output: [1]

node1 = ListNode.new(1)
node2 = ListNode.new(2)
node3 = ListNode.new(3)
node4 = ListNode.new(4)
node5 = ListNode.new(5)
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

# print_list_node(node1)
print_list_node(swap_pairs(node1))
