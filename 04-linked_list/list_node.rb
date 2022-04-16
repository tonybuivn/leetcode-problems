# frozen_string_literal: true

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil) # rubocop:disable Lint/UnderscorePrefixedVariableName
    @val = val
    @next = _next
  end
end

def insert_to_list(list_node, val)
  new_node = ListNode.new(val)
  return new_node unless list_node

  list_node.next = new_node
  list_node.next
end

def print_list_node(list_node)
  return unless list_node

  puts list_node.val
  print_list_node(list_node.next)
end
