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
  @root = build_tree(@data)
end

def build_tree(arr)
  return nil if arr.empty?

  mid = (arr.size - 1) / 2
  node = Node.new(arr[mid])
  node.left = build_tree(arr[0...mid])
  node.right = build_tree(arr[(mid+1)..-1])

  node
end

def insert(value, current=@root)
  return Node.new(value) if current.nill?
  return current if current.data == value

  if current.data < value then current.right = insert(value, current.right) end
  if current.data > value then current.left = insert(value, current.left) end

  current
end

def min_value_node(node)
  current = node

  until current.left.nil?
    current = current.left
  end

  current
end

def delete(value, current=@root)
  return current if current.nil? end

  current.left = delete(value, current.left) if value < current.value
  current.right = delete(value, current.right) if value > current.value

  if current.left.nil?
    temp = current.right
    current = nil
    return temp
  end

  if current.right.nil?
    temp = current.left
    current = nil
    return temp
  end

  temp = min_value_node(current.right)
  current.value = temp.value
  current.right = delete(temp.value, current.right)

  return current
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