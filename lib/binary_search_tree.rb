class Node
  attr_accessor: :data, :left, :right

  def initialize(data)
    @data = data
    @left = null
    @right = null
  end
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

  def insert(value, current = @root)
    return Node.new(value) if current.nill?
    return current if current.data == value

    current.right = insert(value, current.right) if current.data < value
    current.left = insert(value, current.left)   if current.data > value

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

    current.left = delete(value, current.left)   if value < current.value
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

  def find(value, current = @root)
    until current.nil? || current.value == value
      current = current.left if current.value > value
      current = current.right if current.value < value
    end

    current
  end

  def level_order(queue = [@root])
    until queue.empty?
      node = queue.shift
      yield(node) if block_given?
      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end
  end

  def inorder(node = @root)
    return if node.nil?

    inorder(node.left)
    print "#{node.data} "
    yield(node) if block_given?
    inorder(node.right)
  end

  def preorder(node = @root)
    return if node.nil?

    print "#{node.data}"
    yield(node) if block_given?
    preorder(node.left)
    preorder(node.right)
  end

  def postorder(node = @root)
    return if node.nil?

    postorder(node.left)
    postorder(node.right)
    print "#{node.data}"
    yield(node) if block_given?
  end

  def height(node = @root)
    return -1 if node.nil?
    left = height(node.left)
    right = height(node.right)
    return [left, right].max + 1
  end

  def depth(node)

  end

  def balanced?

  end

  def rebalance

  end
end