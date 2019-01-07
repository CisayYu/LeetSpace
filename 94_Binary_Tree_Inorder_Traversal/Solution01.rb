# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Integer[]}
# 中序遍历
def inorder_traversal(root)
  res = []
  if root == nil or root.val == nil
    return []
  end

  if root.left
    res << inorder_traversal(root.left)
  end

  res << root.val

  if root.right
    res << inorder_traversal(root.right)
  end

  res.flatten
end

class Stack
  attr_accessor :stack_array
  def initialize()
    @stack_array = []
  end

  def push(node)
    stack_array << node
  end

  def peek
    stack_array[stack_array.count - 1]
  end

  def pop
    stack_array.delete_at(stack_array.count - 1)
  end

  def count
    stack_array.count
  end
end

# 用栈实现的中序遍历
def inorder_traversal_iterative(root)
  res = []
  if root == nil or root.val == nil
    return []
  end

  stack = Stack.new
  stack.push(root)

  while stack.count > 0
    current = stack.peek
    # 一直向左遍历到底
    if current.left
      stack.push(current.left)
      current.left = nil
      next
    end

    # 左节点先写入，然后写入父节点
    res << stack.pop.val

    # 然后右节点入栈
    if current.right
      stack.push(current.right)
      current.right = nil
      next
    end
  end

  res
end

#     1
#   2   4
# 3
root = TreeNode.new(1)
root.left = TreeNode.new(2)
root.left.left = TreeNode.new(3)
root.left.right = TreeNode.new(5)
root.right = TreeNode.new(4)

puts inorder_traversal_iterative(root)