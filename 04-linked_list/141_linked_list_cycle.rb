# frozen_string_literal: true

require_relative './list_node'

# @param {ListNode} head
# @return {Boolean}
def cycle?(head)
  return false if head.nil?

  slow = fast = head

  until fast.next.nil? || fast.next.next.nil?
    slow = slow.next
    fast = fast.next.next

    return true if slow == fast
  end

  false
end

node1 = ListNode.new(3)
node2 = ListNode.new(2)
node3 = ListNode.new(0)
node4 = ListNode.new(4)
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node2

puts cycle?(node1)
