# frozen_string_literal: true

require_relative './list_node'

# @param {ListNode} head
# @param {Integer} left
# @param {Integer} right
# @return {ListNode}
def reverse_between(head, left, right)
  return unless head

  head = head.next while head.val < left
  new_sub_head = nil

  while head.val <= right
    next_node = head.next
    head.next = new_sub_head
    new_sub_head = head

    # increment
    head = next_node
  end
end

node1 = ListNode.new(1)
node2 = ListNode.new(2)
node3 = ListNode.new(3)
node4 = ListNode.new(4)
node5 = ListNode.new(5)
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

puts 'Linked list 1'
print_list_node(node1)

linked_list2 = reverse_between(node1, 2, 4)

puts 'Linked list 2'
print_list_node(linked_list2)
