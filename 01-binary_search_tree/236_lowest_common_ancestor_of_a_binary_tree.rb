# frozen_string_literal: true

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, a, b)
  # find condition to return nil
  return root if (root == nil || root == a || root == b)

  left = lowest_common_ancestor(root.left, a, b)
  right = lowest_common_ancestor(root.right, a, b)

  left && right ? root : left || right
end
