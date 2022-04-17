# frozen_string_literal: true

require_relative './tree_node'
require 'pry'

# @param {TreeNode} root
# @param {Integer} low
# @param {Integer} high
# @return {TreeNode}
def trim_bst(root, low, high)
  return root if root.nil?

  return trim_bst(root.right, low, high) if root.val < low
  return trim_bst(root.left, low, high) if root.val > high

  root.left = trim_bst(root.left, low, high)
  root.right = trim_bst(root.right, low, high)
  root
end

# tree_node = TreeNode.new
# array2 = [3, 0, 4, 2, 1]
# array2.each { |el| tree_node = insert(tree_node, el) }

# root = trim_bst(tree_node, 1, 3)
# puts root.val
