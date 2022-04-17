# frozen_string_literal: true

require_relative './list_node'

# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
def merge_two_lists(list1, list2) # rubocop:disable Metrics/MethodLength
  curr = ListNode.new
  head = curr

  while list1 && list2
    if list1.val < list2.val
      curr.next = list1
      list1 = list1.next
    else
      curr.next = list2
      list2 = list2.next
    end
    curr = curr.next
  end

  curr.next = list1 || list2
  head.next
end

# list_array1 = [1, 3, 5]
# list_array2 = [2, 4]
node1 = ListNode.new(1)
node2 = ListNode.new(2)
node3 = ListNode.new(3)
node4 = ListNode.new(4)
node5 = ListNode.new(5)
node1.next = node3
node3.next = node5
node2.next = node4

linked_list1 = node1
linked_list2 = node2

puts 'Linked list 1'
print_list_node(linked_list1)

puts 'Linked list 2'
print_list_node(linked_list2)

merged_list = merge_two_lists(linked_list1, linked_list2)
puts 'Merged list'
print_list_node(merged_list)
