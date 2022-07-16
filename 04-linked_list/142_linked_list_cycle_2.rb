# frozen_string_literal: true

require_relative './list_node'
require 'pry'

# @param {ListNode} head
# @return {ListNode}
def detect_cycle(head)
  return nil if head.nil?

  slow = fast = head

  # binding.pry
  until fast.next.nil? || fast.next.next.nil?
    slow = slow.next
    fast = fast.next.next

    if slow == fast
      slow = head
      while slow != fast
        slow = slow.next
        fast = fast.next
      end

      return slow
    end
  end

  nil
end

node1 = ListNode.new(3)
node2 = ListNode.new(2)
node3 = ListNode.new(0)
node4 = ListNode.new(4)
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node2

head1 = ListNode.new(1)

puts detect_cycle(head1)
