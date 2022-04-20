# frozen_string_literal: true

# @param {TreeNode} root
# @return {Integer[]}
def preorder_traversal(root)
  preorder_traversal_helper(root, [])
end

def preorder_traversal_helper(curr, arr)
  return [] unless curr

  arr << curr.val
  preorder_traversal_helper(curr.left, arr)
  preorder_traversal_helper(curr.right, arr)

  arr
end

# TODO : Implement preorder traverse using stack and iterative method
# def preorder_traversal_iteration(root)
# end
