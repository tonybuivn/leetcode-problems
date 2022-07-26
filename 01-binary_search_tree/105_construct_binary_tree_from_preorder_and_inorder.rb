# frozen_string_literal: true

require_relative './tree_node'
require_relative './94_bst_inorder_traversal'
require 'pry'

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
  return nil if inorder.empty?

  root = TreeNode.new(preorder[0])
  root_index = search_inorder(inorder, root.val)
  preorder.shift
  root.left = build_tree(preorder, inorder.slice(0, root_index))
  root.right = build_tree(preorder, inorder.slice(root_index + 1, inorder.length - 1))

  root
end

def search_inorder(inorder, target)
  inorder.each_with_index do |el, index|
    return index if el == target
  end
  -1
end

# Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
# Output: [3,9,20,null,null,15,7]

preorder = [3, 9, 20, 15, 7]
inorder = [9, 3, 15, 20, 7]
root = build_tree(preorder, inorder)
# puts search_inorder(inorder, 3)

# TODO: https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/discuss/34538/My-Accepted-Java-Solution
