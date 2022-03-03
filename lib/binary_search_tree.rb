class Node
  attr_accessor: :data, :left, :right

  def initialize(data)
    self.data = data
    self.left = null
    self.right = null
end


class Tree
attr_accessor: :root

def build_tree(arr)
  arr.sort
  return null if arr.size == 1

  mid = arr.size / 2
  node = Node(arr[mid])
  node.left = build_tree(arr[0]..arr[mid-1])
  node.right = build_tree(arr[mid+1]..arr[-1])
  return node
end

def insert

end

def delete

end

def find

end

def level_order

end

def inorder(&block)

end

def preorder(&block)

end

def postorder(&block)

end

def height(node)

end

def depth(node)

end

def balanced?

end

def rebalance

end
end