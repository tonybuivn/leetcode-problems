# frozen_string_literal: true

require 'pry'

# Definition for linked-list node.
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil) # rubocop:disable Lint/UnderscorePrefixedVariableName
    @val = val
    @next = _next
  end
end

# Definition for single-linked list.
class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end
end

def insert_to_list(list_node, val)
  new_node = ListNode.new(val)
  return new_node unless list_node

  list_node.next = new_node
  list_node.next
end

def create_list_from_array(arr)
  head = nil
  curr = nil
  arr.each do |el|
    node = ListNode.new(el)
    if head.nil?
      head = node
      curr = head
    else
      curr.next = node
      curr = node
    end
  end
  head
end

def print_list_node(list_node)
  return unless list_node

  puts list_node.val
  print_list_node(list_node.next)
end
