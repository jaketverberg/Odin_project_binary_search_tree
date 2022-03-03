class Node
  attr_accessor: :data, :left, :right

  def initialize(data)
    @data = data
    @left = null
    @right = null
end


class Tree
attr_accessor: :root, :data

def initialize(array)
  @data = array.sort.uniq
  @root = build_tree(data)
end

def build_tree(arr)
  return nil if arr.empty?

  mid = (arr.size - 1) / 2
  node = Node.new(arr[mid])
  node.left = build_tree(arr[0...mid])
  node.right = build_tree(arr[(mid+1)..-1])

  node
end

def insert(value, root=@root)
  return Node.new(value) if root.nill?
  return root if root.data == value

  if root.data < value then root.right = insert(value, root.right) end
  if root.data > value then root.left = insert(value, root.left) end
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