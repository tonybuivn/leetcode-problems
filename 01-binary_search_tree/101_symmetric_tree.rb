# frozen_string_literal: true

require_relative './tree_node'
require 'pry'

# @param {TreeNode} root
# @return {Boolean}
def symmetric?(root)
  root.nil? || symmetric_helper?(root.left, root.right)
end

def symmetric_helper?(left, right)
  return (left == right) if left.nil? || right.nil?
  return false if left.val != right.val

  symmetric_helper?(left.left, right.right) && symmetric_helper?(left.right, right.left)
end

# array = [5, 3, 6, 2, 4, 8, 7]
# array = [5, 3, 6, 4, 7]
# array = [1, 2, 3]
tree_node = TreeNode.new(array[0])
array.each { |el| tree_node = insert(tree_node, el) }

puts symmetric?(tree_node)
