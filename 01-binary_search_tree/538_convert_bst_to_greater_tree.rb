# frozen_string_literal: true

require_relative './tree_node'

# @param {TreeNode} root
# @return {TreeNode}
def convert_bst(root)
  convert(root, 0)
  root
end

def convert(curr, sum)
  return sum unless curr

  right = convert(curr.right, sum)
  curr.val += right
  convert(curr.left, curr.val)
end

tree_node = TreeNode.new
array = [4, 1, 6, 0, 2, 5, 7, 3, 8]
array.each { |el| tree_node = insert(tree_node, el) }

print_preorder_dfs(tree_node)
puts 'After convert'
print_preorder_dfs(convert_bst(tree_node))
