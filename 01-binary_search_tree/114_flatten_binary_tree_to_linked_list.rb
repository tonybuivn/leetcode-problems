# frozen_string_literal: true

require_relative './tree_node'
require_relative './94_bst_inorder_traversal'
require_relative './144_bst_preorder_traversal'

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Void} Do not return anything, modify root in-place instead.
def flatten(root)
  flatten_helper(root)[0]
end

def flatten_helper(root)
  return [nil, nil] if root.nil?
  return [root, root] if root.left.nil? && root.right.nil?

  left_res = flatten_helper(root.left)
  right_res = flatten_helper(root.right)
  root.left = nil
  if left_res[0].nil?
    root.right = right_res[0]
  else
    root.right = left_res[0]
    left_res[1].right = right_res[0]
  end

  end_node = right_res[0].nil? ? left_res[1] : right_res[1]

  [root, end_node]
end

# array = [4, 2, 5, 1, 3, 6]
# tree_node = TreeNode.new(array[0])
# array.each { |el| tree_node = insert(tree_node, el) }
# flatten(tree_node)
# TODO :
# https://leetcode.com/problems/flatten-binary-tree-to-linked-list/discuss/36987/Straightforward-Java-Solution
# https://leetcode.com/problems/flatten-binary-tree-to-linked-list/discuss/37010/Share-my-simple-NON-recursive-solution-O(1)-space-complexity!
