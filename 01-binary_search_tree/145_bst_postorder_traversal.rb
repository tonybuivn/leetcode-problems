# frozen_string_literal: true

# @param {TreeNode} root
# @return {Integer[]}
def postorder_traversal(root)
  postorder_traversal_helper(root, [])
end

def postorder_traversal_helper(curr, arr)
  return [] unless curr

  postorder_traversal_helper(curr.left, arr)
  postorder_traversal_helper(curr.right, arr)

  arr << curr.val
  arr
end

# TODO : Implement postorder traverse using stack and iterative method
# def postorder_traversal_iteration(root)
# end
