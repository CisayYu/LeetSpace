# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# 先序遍历
def preorder_traversal(root)
  res = []
  if root == nil or root.val == nil
    return []
  end
  res << root.val
  if root.left
    res << preorder_traversal(root.left)
  end
  if root.right
    res << preorder_traversal(root.right)
  end

  res.flatten ? res.flatten : "[]"
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

# 用栈实现的先序遍历
def preorder_traversal_iterative(root)
  res = []
  if root == nil or root.val == nil
    return []
  end

  stack = Stack.new

  # 先序遍历，先把根元素读入到栈中
  stack.push(root)
  res << root.val

  while stack.count > 0
    # 取出栈顶元素
    current = stack.peek
    if current.left
      # 入栈时写入结果
      res << current.left.val
      stack.push(current.left)
      current.left = nil
      # 一直向左遍历到底
      next
    end
    # 然后一直向右遍历到底
    if current.right
      res << current.right.val
      stack.push(current.right)
      current.right = nil
      next
    end

    # 子节点为空，表示已经遍历结束
    stack.pop
  end

  res
end

#     1
#   2   4
# 3
root = TreeNode.new(1)
root.left = TreeNode.new(2)
root.left.left = TreeNode.new(3)
root.right = TreeNode.new(4)

puts preorder_traversal_iterative(root)