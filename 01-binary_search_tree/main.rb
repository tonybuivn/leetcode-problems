# frozen_string_literal: true

require_relative './tree_node'
require 'pry'

def insert(root, val)
  return TreeNode.new(val) if root.nil?

  if val < root.val
    root.left = insert(root.left, val)
  elsif val > root.val
    root.right = insert(root.right, val)
  end

  root
end

# @param {TreeNode} root
# @param {Integer} val
# @return {TreeNode}
def search_bst(root, val)
  return [] if root.nil?

  if val < root.val
    search_bst(root.left, val)
  elsif val > root.val
    search_bst(root.right, val)
  else
    root
  end
end

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

# Test search_bst
# array_1 = [4, 2, 7, 1, 3]
# val = 5
# array_1.each { |el| tree_node = insert(tree_node, el) }
# node_result = search_bst(tree_node, val)

# puts "[#{node_result.val}, #{node_result.left.val}, #{node_result.right.val}]"

# tree_node = TreeNode.new
# array2 = [3, 0, 4, 2, 1]
# array2.each { |el| tree_node = insert(tree_node, el) }

# root = trim_bst(tree_node, 1, 3)
# puts root.val
