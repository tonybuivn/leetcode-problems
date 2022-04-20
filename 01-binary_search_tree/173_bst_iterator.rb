# frozen_string_literal: true

require_relative './tree_node'

# https://leetcode.com/problems/binary-search-tree-iterator/discuss/52526/Ideal-Solution-using-Stack-(Java)

# BSTIterator class
class BSTIterator
  attr_accessor :stack

  # :type root: TreeNode
  def initialize(root)
    @stack = []
    push_all(root)
  end

  # :rtype: Integer
  def next
    temp_node = @stack.pop
    push_all(temp_node.right)
    temp_node.val
  end

  # :rtype: Boolean
  def has_next # rubocop:disable Naming/PredicateName
    !stack.empty?
  end

  private

  def push_all(node)
    until node.nil?
      @stack.push(node)
      node = node.left
    end
  end
end

# Your BSTIterator object will be instantiated and called as such:
iterator = BSTIterator.new(root)
param_1 = iterator.next
param_2 = iterator.has_next
