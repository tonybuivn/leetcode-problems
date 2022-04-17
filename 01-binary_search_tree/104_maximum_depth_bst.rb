# frozen_string_literal: true

require_relative './tree_node'
require 'pry'

# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
  max_depth_helper(root, 0)
end

def max_depth_helper(curr, depth)
  return depth unless curr

  depth_left = max_depth_helper(curr.left, depth + 1)
  depth_right = max_depth_helper(curr.right, depth + 1)

  depth_left > depth_right ? depth_left : depth_right
end

# array = [5, 3, 6, 2, 4, 8, 1, 7, 9]
# tree_node = TreeNode.new(array[0])
# array.each { |el| tree_node = insert(tree_node, el) }

# puts max_depth(tree_node)
