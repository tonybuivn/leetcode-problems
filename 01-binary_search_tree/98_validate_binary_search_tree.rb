# frozen_string_literal: true

require_relative './tree_node'

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
# @return {Boolean}
def valid_bst?(root)
  valid_bst_helper?(root, (-1.0 / 0.0), (1.0 / 0.0))
end

def valid_bst_helper?(root, min_val, max_val)
  return true if root.nil?
  return false if root.val >= max_val || root.val <= min_val

  valid_bst_helper?(root.left, min_val, root.val) && valid_bst_helper?(root.right, root.val, max_val)
end

# array = [5,1,4,nil,nil,3,6]
# tree_node = TreeNode.new(array[0])
# array.each { |el| tree_node = insert(tree_node, el) }
# print_preorder_dfs(tree_node)
