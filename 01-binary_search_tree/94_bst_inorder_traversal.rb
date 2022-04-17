# frozen_string_literal: true

require_relative './tree_node'
require 'pry'

# @param {TreeNode} root
# @return {Integer[]}
def inorder_traversal(root)
  inorder_traverse(root, [])
end

def inorder_traverse(curr, res)
  return [] unless curr

  # Recursively traverse left subtree
  inorder_traverse(curr.left, res)

  # Visit current root nood
  res << curr.val

  # Recursively traverse right subtree
  inorder_traverse(curr.right, res)
  res
end

array = [5, 3, 6, 2, 4, 8, 1, 7, 9]
tree_node = TreeNode.new(array[0])
array.each { |el| tree_node = insert(tree_node, el) }

inorder_traversal(tree_node).each { |el| puts el }
